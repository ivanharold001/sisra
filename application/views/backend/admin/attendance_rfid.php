
<section class="panel">
	<div class="panel-body">
		<div class="content-wrapper" id="app">
			<div class="container-xxl flex-grow-1 container-p-y">
				<div class="card">
					<h5 class="card-header">Tarjetas asignadas</h5>
					<div class="table-responsive text-nowrap">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>
										Estudiantes
									</th>
									<th>
										Serial RFID
									</th>
									<th>
										Acciónes
									</th>
								</tr>
							</thead>
							<tbody>
								<tr v-for="estudiante in estudiantes">
									<td>{{estudiante.name}}</td>
									<td>
										<h4 v-if="estudiante.rfid_serial"><span class="badge bg-success"><i class="fa fa-check"></i>&nbsp;Asignado ({{estudiante.rfid_serial}})</span></h4>
										<h4 v-else-if="estudiante.waiting"><span class="badge bg-danger"><i class="fa fa-clock"></i>&nbsp;Esperando... Lea una tarjeta RFID</span></h4>
										<h4 v-else><span class="badge bg-dark text-uppercase"><i class="fa fa-times"></i>&nbsp;No asignado</span></h4>
									</td>
									<td>
										<button @click="removeRfidCard(estudiante.rfid_serial)" v-if="estudiante.rfid_serial" class="btn btn-danger">Remover</button>
										<button v-else-if="estudiante.waiting" @click="cancelWaitingForPairing" class="btn btn-warning">Cancelar</button>
										<button @click="assignRfidCard(estudiante)" v-else class="btn btn-primary">Asignar</button>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>

			</div>

		</div>
	</div>

</section>

<script src="<?php echo base_url(); ?>assets/javascripts/vue.min.js" type="text/javascript"></script>
<script src="<?php echo base_url(); ?>assets/javascripts/vue-toasted.min.js" type="text/javascript"></script>

<script>
    Vue.use(Toasted);
    let shouldCheck = true;
    const CHECK_PAIRING_EMPLOYEE_INTERVAL = 1000;
    new Vue({
        el: "#app",
        data: () => ({
            estudiantes: [],
            date: "",
        }),
        async mounted() {
            await this.setReaderForReading();
            await this.refreshEmployeesList();
        },
        methods: {
            async removeRfidCard(rfidSerial) {
                await fetch("./rfid_assets/remove_rfid_card.php?rfid_serial=" + rfidSerial);
                this.$toasted.show("RFID removido", {
                    position: "top-left",
                    duration: 1000,
                });
                await this.refreshEmployeesList();
            },
            async cancelWaitingForPairing() {
                shouldCheck = false;
                await this.setReaderForReading();
            },
            async setReaderForReading() {
                await fetch("./rfid_assets/set_reader_for_reading.php");
            },
            async assignRfidCard(estudiante) {
                shouldCheck = true;
                const employeeId = estudiante.student_id;
                estudiante.waiting = true;
                await fetch("./rfid_assets/set_reader_for_pairing.php?student_id=" + employeeId);
                this.checkIfEmployeeHasJustAssignedRfid(estudiante);
            },
            async checkIfEmployeeHasJustAssignedRfid(estudiante) {
                const r = await fetch("./rfid_assets/get_estudiante_rfid_serial_by_id.php?student_id=" + estudiante.student_id);
                const serial = await r.json();
                if (!shouldCheck) {
                    estudiante.waiting = false;
                    return;
                }
                if (serial) {
                    this.$toasted.show("RFID asignado!", {
                        position: "top-left",
                        duration: 1000,
                    });
                    await this.setReaderForReading();
                    await this.refreshEmployeesList();
                } else {
                    setTimeout(() => {
                        this.checkIfEmployeeHasJustAssignedRfid(estudiante);
                    }, CHECK_PAIRING_EMPLOYEE_INTERVAL);
                }
            },
            async refreshEmployeesList() {
                // Obtener todos los estudiantes
                let response = await fetch("./rfid_assets/get_estudiante_ajax.php");
                let estudiantes = await response.json();
                // Establezca rfid_serial por defecto: null
                let employeeDictionary = {};
                estudiantes = estudiantes.map((estudiante, index) => {
                    employeeDictionary[estudiante.student_id] = index;
                    return {
                        student_id: estudiante.student_id,
                        name: estudiante.name,
                        rfid_serial: null,
                        waiting: false,
                    }
                });
                // Obtener datos RFID, si los hay
                response = await fetch(`./rfid_assets/get_estudiante_with_rfid.php`);
                let rfidData = await response.json();
                // Actualizar los datos de rfid en cada empleado, si corresponde
                rfidData.forEach(rfidDetail => {
                    let employeeId = rfidDetail.student_id;
                    if (employeeId in employeeDictionary) {
                        let index = employeeDictionary[employeeId];
                        estudiantes[index].rfid_serial = rfidDetail.rfid_serial;
                    }
                });
                // Deja que Vue haga su magia ;)
                this.estudiantes = estudiantes;
            }
        },
    });
</script>