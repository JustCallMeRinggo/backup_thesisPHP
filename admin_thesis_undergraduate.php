<?php

  require 'dbconnect.php';
  session_start();

  $userID = $_SESSION['user_id'];


  //checks whether a user account is logged in or not
  if(!$userID)
  {
      header('location: index.html');
  }

  $queryUser = "SELECT * FROM tblUsers WHERE user_id = '$userID'";
  $queryUserResult = mysqli_query($conn, $queryUser);

  //fetching of result of queryUserResult

  $rowUser = mysqli_fetch_assoc($queryUserResult);

  //preparation of session ID for next landing page

  $_SESSION['user_id'] = $userID;
?>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Thesys | Theses (Undergraduate)</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
        page. However, you can choose any other skin. Make sure you
        apply the skin class to the body tag so the changes take effect. -->
  <link rel="stylesheet" href="dist/css/skins/skin-blue.min.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<!--
BODY TAG OPTIONS:
=================
Apply one or more of the following classes to get the
desired effect
|---------------------------------------------------------|
| SKINS         | skin-blue                               |
|               | skin-black                              |
|               | skin-purple                             |
|               | skin-yellow                             |
|               | skin-red                                |
|               | skin-green                              |
|---------------------------------------------------------|
|LAYOUT OPTIONS | fixed                                   |
|               | layout-boxed                            |
|               | layout-top-nav                          |
|               | sidebar-collapse                        |
|               | sidebar-mini                            |
|---------------------------------------------------------|
-->
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <!-- Main Header -->
  <header class="main-header">

    <!-- Logo -->
    <a href="index2.html" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
       <span class="logo-mini"><b>T</b>SYS</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>THE</b>SYS</span>
    </a>

    <!-- Header Navbar -->
    <nav class="navbar navbar-static-top" role="navigation">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
      <!-- Navbar Right Menu -->
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
  
          <!-- User Account Menu -->
          <li class="dropdown user user-menu">
            <!-- Menu Toggle Button -->
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <!-- The user image in the navbar-->
              <img src="dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
              <!-- hidden-xs hides the username on small devices so only the image appears. -->
              <span class="hidden-xs"><?php echo $rowUser['last_name'];?></span>
            </a>
            <ul class="dropdown-menu">
              <!-- The user image in the menu -->
              <li class="user-header">
                <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">

                <p>
                  Baron Zemo - Hydra
                  <small>Member since December 16, 1991</small>
                </p>
              </li>

              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a href="#" class="btn btn-default btn-flat">Profile</a>
                </div>
                <div class="pull-right">
                  <a href="logout.php" class="btn btn-default btn-flat">Sign out</a>
                </div>
              </li>
            </ul>
          </li>
          <!-- Control Sidebar Toggle Button -->
          <li>
            <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
          </li>
        </ul>
      </div>
    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">

    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">

      <!-- Sidebar user panel (optional) -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p><?php echo $rowUser['first_name']; echo " "; echo $rowUser['last_name'] ?></p>
          <!-- Status -->
         
        </div>
      </div>

      <!-- search form (Optional) -->
      
      <!-- /.search form -->

      <!-- Sidebar Menu -->
      <ul class="sidebar-menu" data-widget="tree">
      
        <!-- Optionally, you can add icons to the links -->
        <li><a href="admin_dashboard.php"><i class="fa fa-th"></i> <span>Dashboard</span></a></li>
        <li class="treeview">
          <a href="#"><i class="fa fa-users"></i> <span>Users</span>
            <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="admin_users_admin.php"> <i class="fa fa-user-secret"></i> Administrators</a></li>
            <li><a href="admin_users_faculty.html"><i class="fa fa-user"></i> Faculty</a></li>
            <li><a href="admin_users_student.html"><i class="fa fa-users"></i> Students</a></li>
            <li><a href="admin_users_visitors.html"><i class="fa fa-question-circle"></i> Visitors</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#"><i class="fa fa-book"></i> <span>Theses</span>
            <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
          </a>
          <ul class="treeview-menu">
            <li class="active"><a href="admin_undergraduate.html"><i class="fa fa-graduation-cap"></i> Undergraduate</a></li>
            <li><a href="admin_masteral.html"><i class="fa fa-industry"></i> Masteral</a></li>
            <li><a href="admin_doctorate.html"><i class="fa fa-institution"></i> Doctorate</a></li>
          </ul>
        </li>
          <li><a href="#"><i class="fa fa-th"></i> <span>Requests</span></a></li>
        </li>
      </ul>

      <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
    <h1>
    Theses
    <small>Undergraduate</small>
    </h1>
    <ol class="breadcrumb">
    <li><a href="admin_dashboard.php"><i class="fa fa-dashboard"></i> Home</a></li>
    <li class="active">Theses (Undergraduate)</li>
    </ol>

    <!--ADD ADMIN MODAL-->
    <div class="modal fade" id="modal_addAdmin" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    Add an Administrator
                </div>
                <div class="modal-body">
                <div class="box-body">
                    <table class="table table-bordered">
                        <tr>
                            <td>Thesis ID</td>
                            <td> 
                              <input type="text" name="add_txtUsername" class="form-control">
                            </td>
                        </tr>
                        <tr>
                            <td>Thesis Name</td>
                            <td>
                                <input type="password" name="add_txtPassword" class="form-control">
                            </td>
                        </tr>
                        <tr>
                            <td>Thesis FIle</td>
                            <td>
                              <input type="file" name="add_flThesisFile">
                                <asp:TextBox ID="add_txtFirstName" runat="server" CssClass="form-control"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Year Accomplished:</td>
                            <td>
                                <input type="text" name="add_txtYear" class="form-control">
                            </td>
                        </tr>
                    </table>
                </div>
                </div>
                <div class="modal-footer">
                  <button type="button" name= "btnAddThesis" class="btn btn-success">Add Thesis Record</button>
                </div>
            </div>
        </div>
    </div>
    <!--END ADD ADMIN MODAL-- >
    <div class="row">
        
        <div class="col-lg-4">
            <table style="width:100%;" class="form-control">
                <tr>
                    <td>
                      <select name="ddlThesisStatus">
                        <option>Active</option>
                      </select>
                       <!-- <asp:DropDownList ID="ddlView" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlView_SelectedIndexChanged">
                            <asp:ListItem Value="1" Text="Active"></asp:ListItem>
                            <asp:ListItem Value="0" Text="Inactive"></asp:ListItem>
                        </asp:DropDownList>
                      -->
                    </td>
                    <td class="text-right">
                        <button type="button" class="btn btn-success" data-toggle="modal" data-target="#modal_addAdmin">Add a new Thesis</button>
                    </td>
                </tr>
                <br>
                <br>
            </table>
            <div>
            <table class="table table-bordered" style="width:100%;">
              <tr>
                <th>Thesis ID</th>
                <th>Thesis Title</th>
                <th>Middle Initial</th>
                <th>Date Added</th>
                <th>Actions</th>
              </tr>

              <?php
                $queryTheses = "SELECT * FROM tblThesis";
                $queryThesesResult = mysqli_query($conn, $queryTheses);

                while($rowTheses = mysqli_fetch_array($queryThesesResult))
                {
                  $i = 1;
              ?>

              <tr>
                <td><?php echo $rowTheses['thesis_id']; ?></td>
                <td><?php echo $rowTheses['thesis_title']; ?></td>
                <td><?php echo $rowTheses['status']; ?></td>
                <td><?php echo $rowTheses['year_accomplished']; ?></td>
              <!--
                Ang mga button sa ibaba ay isama sa loob ng loop kapag nag-retrieve na ng records galing database
              -->
                <td>
                  <button type="button" class="btn btn-sm btn-danger">Archive</button>
                  <button type="button" class="btn btn-sm btn-warning">Edit</button>
               </td>
               <?php
                $i++;
                }
               ?>
              </tr>
          </table>
          </div>
        </div>
    

</section>
 <!-- Main content -->
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Main Footer -->
  <footer class="main-footer">
    <!-- To the right -->
    <div class="pull-right hidden-xs">
      Anything you want
    </div>
    <!-- Default to the left -->
    <strong>Copyright &copy; 2016 <a href="#">Company</a>.</strong> All rights reserved.
  </footer>

  
  <!-- Add the sidebar's background. This div must be placed
  immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- REQUIRED JS SCRIPTS -->

<!-- jQuery 3 -->
<script src="bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>

<!-- Optionally, you can add Slimscroll and FastClick plugins.
     Both of these plugins are recommended to enhance the
     user experience. -->
</body>
</html>