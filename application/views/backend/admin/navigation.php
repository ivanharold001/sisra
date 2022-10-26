<!-- start: sidebar -->
<aside id="sidebar-left" class="sidebar-left">

	<div class="sidebar-header">
		<div class="sidebar-title">
			Menu
		</div>
		<div class="sidebar-toggle hidden-xs" data-toggle-class="sidebar-left-collapsed" data-target="html" data-fire-event="sidebar-left-toggle">
			<i class="fa fa-bars" aria-label="Toggle sidebar"></i>
		</div>
	</div>

	<div class="nano">
		<div class="nano-content">
			<nav id="menu" class="nav-main" role="navigation">
				<ul class="nav nav-main">

			<!-- DASHBOARD -->
			<li class="<?php if ($page_name == 'dashboard') echo 'nav-active'; ?> ">
				<a href="<?php echo base_url(); ?>index.php?admin/dashboard">
					<i class="fa fa-tachometer"></i>
					<span><?php echo get_phrase('dashboard'); ?></span>
				</a>
			</li>

			<!-- STUDENT -->
			<li class="<?php if ($page_name == 'student_information' || $page_name == 'student_marksheet' || $page_name == 'student_bulk_add' || $page_name == 'student_add' ) echo 'nav-active'; ?> ">
				<a href="<?php echo base_url(); ?>index.php?admin/student_information">
					 <i class="fa fa-slideshare"></i>
					<span><?php echo get_phrase('student'); ?></span>
				</a>
			</li>

			<!-- TEACHER -->
			<li class="<?php if ($page_name == 'teacher') echo 'nav-active'; ?> ">
				<a href="<?php echo base_url(); ?>index.php?admin/teacher">
					<i class="fa fa-users"></i>
					<span><?php echo get_phrase('teacher'); ?></span>
				</a>
			</li>

			<!-- PARENTS -->
			<li class="<?php if ($page_name == 'parent') echo 'nav-active'; ?> ">
				<a href="<?php echo base_url(); ?>index.php?admin/parent">
					<i class="fa fa-user"></i>
					<span><?php echo get_phrase('parents'); ?></span>
				</a>
			</li>

			<!-- CLASS -->
			<li class="nav-parent <?php
			if ($page_name == 'class' ||
					$page_name == 'section')
				echo 'nav-expanded nav-active';
			?> ">
				<a href="#">
					<i class="fa fa-university"></i>
					<span><?php echo get_phrase('class'); ?></span>
				</a>
				<ul class="nav nav-children">
					<li class="<?php if ($page_name == 'class') echo 'nav-active'; ?> ">
						<a href="<?php echo base_url(); ?>index.php?admin/classes">
							<span><i class="fa fa-circle-o"></i> <?php echo get_phrase('Manejo de Materias'); ?></span>
						</a>
					</li>
					<li class="<?php if ($page_name == 'section') echo 'nav-active'; ?> ">
						<a href="<?php echo base_url(); ?>index.php?admin/section">
							<span><i class="fa fa-circle-o"></i> <?php echo get_phrase('Cursos'); ?></span>
						</a>
					</li>
				</ul>
			</li>

			<!-- CLASS ROUTINE -->
			<li class="<?php if ($page_name == 'class_routine_view' || $page_name == 'class_routine_add') echo 'nav-active'; ?> ">
				 <a href="<?php echo base_url(); ?>index.php?admin/class_routine_view">
					<i class="fa fa-clock-o"></i>
					<span><?php echo get_phrase('class_routine'); ?></span>
				 </a>
			</li>

			<!-- DAILY ATTENDANCE -->
			<li class="nav-parent <?php if ($page_name == 'manage_attendance' ||
									$page_name == 'manage_attendance_view' || $page_name == 'attendance_report' || $page_name == 'attendance_report_view' || $page_name == 'attendance_rfid' || $page_name == 'attendance_rfid_view') 
										echo 'nav-expanded nav-active'; ?> ">
				<a href="#">
					<i class="fa fa-line-chart"></i>
					<span><?php echo get_phrase('daily_attendance'); ?></span>
				</a>
				<ul class="nav nav-children">

						<li class="<?php if (( $page_name == 'attendance_rfid' || $page_name == 'attendance_rfid_view')) echo 'nav-active'; ?>">
							<a href="http://localhost/asistencia-php-rfid/employees_rfid.php">
								<span><i class="fa fa-circle-o"></i> <?php echo get_phrase('Asignar RFID'); ?></span>
							</a>
						</li>

						<li class="<?php if (($page_name == 'manage_attendance' || $page_name == 'manage_attendance_view')) echo 'nav-active'; ?>">
							<a href="http://localhost/asistencia-php-rfid/attendance_register.php">
								<span><i class="fa fa-circle-o"></i> <?php echo get_phrase('daily_atendance'); ?></span>
							</a>
						</li>

						<li class="<?php if (( $page_name == 'attendance_report' || $page_name == 'attendance_report_view')) echo 'nav-active'; ?>">
							<a href="<?php echo base_url(); ?>index.php?admin/attendance_report">
								<span><i class="fa fa-circle-o"></i> <?php echo get_phrase('attendance_report'); ?></span>
							</a>
						</li>

				</ul>
			</li>

			<!-- SETTINGS -->
			<li class="nav-parent <?php
			if ($page_name == 'system_settings' ||
					$page_name == 'manage_language' ||
						$page_name == 'sms_settings')
							echo 'nav-expanded nav-active';
			?> ">
				<a href="#">
					<i class="fa fa-suitcase"></i>
					<span><?php echo get_phrase('settings'); ?></span>
				</a>
				<ul class="nav nav-children">
					<li class="<?php if ($page_name == 'system_settings') echo 'nav-active'; ?> ">
						<a href="<?php echo base_url(); ?>index.php?admin/system_settings">
							<span><i class="fa fa-circle-o"></i> <?php echo get_phrase('general_settings'); ?></span>
						</a>
					</li>
				</ul>
			</li>

			<!-- ACCOUNT -->
			<li class="<?php if ($page_name == 'manage_profile') echo 'nav-active'; ?> ">
				<a href="<?php echo base_url(); ?>index.php?admin/manage_profile">
					<i class="fa fa-lock"></i>
					<span><?php echo get_phrase('my_profile'); ?></span>
				</a>
			</li>
		</ul>
	 </nav>

	</div>

		<script>
			// Maintain Scroll Position
			if (typeof localStorage !== 'undefined') {
				if (localStorage.getItem('sidebar-left-position') !== null) {
					var initialPosition = localStorage.getItem('sidebar-left-position'),
						sidebarLeft = document.querySelector('#sidebar-left .nano-content');

					sidebarLeft.scrollTop = initialPosition;
				}
			}
		</script>

	</div>		
</aside>
<!-- end: sidebar -->


