<?php
session_start();
error_reporting(0);
include('includes/config.php');
if(strlen($_SESSION['login'])==0)
	{	
header('location:../request-blood.php');
}
else{

if(isset($_REQUEST['cancel']))
	{
$aeid=intval($_GET['cancel']);
$Status= 'CANCELLED';

$sql = "UPDATE tblrequetblood SET Status=:Status WHERE  id=:aeid";
$query = $dbh->prepare($sql);
$query -> bindParam(':Status',$Status, PDO::PARAM_STR);
$query-> bindParam(':aeid',$aeid, PDO::PARAM_STR);
$query -> execute();

$msg="Request Cancelled Successfully";
}

if(isset($_REQUEST['reaprove']))
	{
$aeid=intval($_GET['reaprove']);
$Status= 'SENT';

$sql = "UPDATE tblrequetblood SET Status=:Status WHERE  id=:aeid";
$query = $dbh->prepare($sql);
$query -> bindParam(':Status',$Status, PDO::PARAM_STR);
$query-> bindParam(':aeid',$aeid, PDO::PARAM_STR);
$query -> execute();

$msg="Request Re-Sent Successfully";
}

?>

?>
<!doctype html>
<html lang="en" class="no-js">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">
	<meta name="theme-color" content="#3e454c">
	
	<title>THBMS | Recipient Requests</title>

	<!-- Font awesome -->
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<!-- Sandstone Bootstrap CSS -->
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<!-- Bootstrap Datatables -->
	<link rel="stylesheet" href="css/dataTables.bootstrap.min.css">
	<!-- Bootstrap social button library -->
	<link rel="stylesheet" href="css/bootstrap-social.css">
	<!-- Bootstrap select -->
	<link rel="stylesheet" href="css/bootstrap-select.css">
	<!-- Bootstrap file input -->
	<link rel="stylesheet" href="css/fileinput.min.css">
	<!-- Awesome Bootstrap checkbox -->
	<link rel="stylesheet" href="css/awesome-bootstrap-checkbox.css">
	<!-- Admin Stye -->
	<link rel="stylesheet" href="css/style.css">
	<style>
		.errorWrap {
    padding: 10px;
    margin: 0 0 20px 0;
    background: #fff;
    border-left: 4px solid #dd3d36;
    -webkit-box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
    box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
}
.succWrap{
    padding: 10px;
    margin: 0 0 20px 0;
    background: #fff;
    border-left: 4px solid #5cb85c;
    -webkit-box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
    box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
}
		</style>
</head>

<body>
<?php include('includes/header.php');?>

	<div class="ts-main-content">
<?php include('includes/leftbar.php');?>
		<div class="content-wrapper">
			<div class="container-fluid">

				<div class="row">
					<div class="col-md-12">

						<h2 class="page-title">View Blood Requests</h2>
						
						<div class="panel panel-default">
							<div class="panel-heading">Recipient Requests</div>
							<div class="panel-body">
							<?php if($error){?><div class="errorWrap"><strong>ERROR</strong>:<?php echo htmlentities($error); ?> </div><?php } 
				else if($msg){?><div class="succWrap"><strong>SUCCESS</strong>:<?php echo htmlentities($msg); ?> </div><?php }?>
								<table id="zctb" class="display table table-striped table-bordered table-hover" cellspacing="0" width="100%">
									<thead>
										<tr>
										<th>#</th>
										<th>FullName </th>
										<th>Email </th>
										<th>Blood Group </th>
										<th>Mobile </th>
										<th>Address </th>
										<th>Details </th>
										<th>Status </th>
										<th>Action </th>
										</tr>
									</thead>
									<tfoot>
										<tr>
										<th>#</th>
										<th>FullName </th>
										<th>Email </th>
										<th>Blood Group </th>
										<th>Mobile </th>
										<th>Address </th>
										<th>Details </th>
										<th>Status </th>
										<th>Action </th>
									</tfoot>
									<tbody>

<?php $sql = "SELECT * from  tblrequetblood where EmailID=:EmailID  ";
$EmailID = $_SESSION['login'];
$query = $dbh -> prepare($sql);
$query->bindParam(':EmailID',$EmailID,PDO::PARAM_STR);
$query->execute();
$results=$query->fetchAll(PDO::FETCH_OBJ);
$cnt=1;
if($query->rowCount() > 0)
{
foreach($results as $result)
{				?>	
										<tr>
											<td><?php echo htmlentities($cnt);?></td>
											<td><?php echo htmlentities($result->FullName);?></td>
											<td><?php echo htmlentities($result->EmailID);?></td>
											<td><?php echo htmlentities($result->BloodGroup);?></td>
											<td><?php echo htmlentities($result->Mobile);?></td>
											<td><?php echo htmlentities($result->Address);?></td>
											<td><?php echo htmlentities($result->Details);?></td>
											<td><?php echo htmlentities($result->Status);?></td>
										
										
										<td>
<?php if($result->Status== 'SENT')
{?>
<a href="view-requests.php?cancel=<?php echo htmlentities($result->id);?>" onclick="return confirm('Do you really want to cancel this request')"> Cancel</a>
<?php } else if($result->Status== 'CANCELLED') {?>

<a href="view-requests.php?reaprove=<?php echo htmlentities($result->id);?>" onclick="return confirm('Do you really want to re-send this request')"> Re-Send</a>
<?php } else {?>

<a href="#"> APPROVED</a>
<?php } ?>
</td>

										</tr>
										<?php $cnt=$cnt+1; }} ?>
										
									</tbody>
								</table>

						

							</div>
						</div>

					</div>
				</div>












			</div>
		</div>
	</div>

	<!-- Loading Scripts -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap-select.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.dataTables.min.js"></script>
	<script src="js/dataTables.bootstrap.min.js"></script>
	<script src="js/Chart.min.js"></script>
	<script src="js/fileinput.js"></script>
	<script src="js/chartData.js"></script>
	<script src="js/main.js"></script>
	
	</script>
</body>
</html>
<?php } ?>