<!-- start: header -->
<header class="header">
	<div class="logo-container">
		<a href="<?php echo base_url();?>index.php?admin/dashboard" class="logo">
			<img src="uploads/logo.png" height="40" />
		</a>
		<div class="visible-xs toggle-sidebar-left" data-toggle-class="sidebar-left-opened" data-target="html" data-fire-event="sidebar-left-opened">
			<i class="fa fa-bars" aria-label="Toggle sidebar"></i>
		</div>
	</div>

	<!-- start: search & user box -->
	<div class="header-right">
		<!--SESSION CHANGER-->
		<form action="pages-search-results.html" class="search nav-form">
			<div class="input-group input-search">
				<div id="session_static">
					<a href="#" style="color: #696969;"
						<?php if($account_type == 'admin'):?> onclick="get_session_changer()" <?php endif;?>>
						<?php echo get_phrase('running_session');?> : <?php echo $running_year;?>
					</a>
				</div>
			</div>
		</form>

		<span class="separator"></span>

		<div id="userbox" class="userbox">
			<a href="#" data-toggle="dropdown">
				<figure class="profile-picture">
					<img src="<?php echo $this->crud_model->get_image_url($this->session->userdata('login_type') , $this->session->userdata($account_type.'_id'));?>" alt="user-image" class="img-circle" data-lock-picture="assets/images/!logged-user.jpg" />
				</figure>
				<div class="profile-info" data-lock-name="<?php echo $this->session->userdata('name');?>" data-lock-email="info@pvssystem.com">
					<span class="name"><?php echo $this->session->userdata('name');?></span>
					<span class="role"><?php echo ucfirst($this->session->userdata('login_type'));?></span>
				</div>

				<i class="fa custom-caret"></i>
			</a>

			<div class="dropdown-menu">
				<ul class="list-unstyled">
					<li class="divider"></li>
					<!-- goto setting -->
					<?php if($account_type == 'admin'):?>
					<li>
						<a role="menuitem" tabindex="-1" href="<?php echo base_url();?>index.php?<?php echo $account_type;?>/system_settings"><i class="fa fa-wrench"></i> <?php echo get_phrase('setting');?></a>
					</li>
					<?php endif;?>
					<!-- goto profile -->
					<li>
						<a role="menuitem" tabindex="-1" href="<?php echo base_url();?>index.php?<?php echo $account_type;?>/manage_profile"><i class="fa fa-user"></i> <?php echo get_phrase('edit_profile');?></a>
					</li>
					<li>
						<a role="menuitem" tabindex="-1" href="<?php echo base_url();?>index.php?login/logout"><i class="fa fa-power-off"></i> Salir</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	
</header>
<!-- end: header -->

<script type="text/javascript">
	function get_session_changer()
	{
		$.ajax({
            url: '<?php echo base_url();?>index.php?admin/get_session_changer/',
            success: function(response)
            {
                jQuery('#session_static').html(response);
            }
        });
	}
</script>
