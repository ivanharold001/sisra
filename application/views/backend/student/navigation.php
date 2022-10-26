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
				<a href="<?php echo base_url(); ?>index.php?<?php echo $account_type; ?>/dashboard">
					<i class="fa fa-tachometer"></i>
					<span><?php echo get_phrase('Panel principal'); ?></span>
				</a>
			</li>


			<!-- TEACHER -->
			<li class="<?php if ($page_name == 'teacher') echo 'nav-active'; ?> ">
				<a href="<?php echo base_url(); ?>index.php?<?php echo $account_type; ?>/teacher_list">
					<i class="fa fa-users"></i>
					<span><?php echo get_phrase('teacher'); ?></span>
				</a>
			</li>

			<!-- CLASS ROUTINE -->
			<li class="<?php if ($page_name == 'class_routine') echo 'nav-active'; ?> ">
				<a href="<?php echo base_url(); ?>index.php?<?php echo $account_type; ?>/class_routine">
					<i class="fa fa-clock-o"></i>
					<span><?php echo get_phrase('class_routine'); ?></span>
				</a>
			</li>

			<!-- ACCOUNT -->
			<li class="<?php if ($page_name == 'manage_profile') echo 'nav-active'; ?> ">
				<a href="<?php echo base_url(); ?>index.php?<?php echo $account_type; ?>/manage_profile">
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