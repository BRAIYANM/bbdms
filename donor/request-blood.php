<?php
session_start();
error_reporting(0);
include('includes/config.php');
if(strlen($_SESSION['login'])==0)
	{	
header('location:../become-donar.php');
}
else{

if(isset($_POST['submit']))
{
$FullName = $_POST['FullName'];
$EmailID = $_POST['EmailID'];
$BloodGroup = $_POST['BloodGroup'];
$Mobile = $_POST['Mobile'];
$Address = $_POST['Address'];
$Details = $_POST['Details'];
$Status= 'SENT';
$sql="INSERT INTO  tblrequetblood(FullName, EmailID, BloodGroup, Mobile, Address, Details, Status) VALUES(:FullName, :EmailID, :BloodGroup, :Mobile, :Address, :Details, :Status)";
$query = $dbh->prepare($sql);
$query->bindParam(':FullName',$FullName,PDO::PARAM_STR);
$query->bindParam(':EmailID',$EmailID,PDO::PARAM_STR);
$query->bindParam(':BloodGroup',$BloodGroup,PDO::PARAM_STR);
$query->bindParam(':Mobile',$Mobile,PDO::PARAM_STR);
$query->bindParam(':Address',$Address,PDO::PARAM_STR);
$query->bindParam(':Details',$Details,PDO::PARAM_STR);
$query->bindParam(':Status',$Status,PDO::PARAM_STR);
$query->execute();
$lastInsertId = $dbh->lastInsertId();
if($lastInsertId)
{
$msg="Blood Request sent successfully";
}
else 
{
$error="Something went wrong. Please try again";
}
}

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
	
	<title>THBMS | Donor Blood Request</title>

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

						<h2 class="page-title">Request for Blood</h2>
						
						<div class="row">
							<div class="col-md-12">
								<div class="panel panel-default">
									<div class="panel-heading">Blood request</div>
<?php if($error){?><div class="errorWrap"><strong>ERROR</strong>:<?php echo htmlentities($error); ?> </div><?php } 
				else if($msg){?><div class="succWrap"><strong>SUCCESS</strong>:<?php echo htmlentities($msg); ?> </div><?php }?>
				<?php
				$useremail=$_SESSION['login'];
$sql = "SELECT * from tblblooddonars where EmailId=:useremail";
$query = $dbh -> prepare($sql);
$query -> bindParam(':useremail',$useremail, PDO::PARAM_STR);
$query->execute();
$results=$query->fetchAll(PDO::FETCH_OBJ);
$cnt=1;
if($query->rowCount() > 0)
{
foreach($results as $result)
{				?>


									<div class="panel-body">
<form method="post" class="form-horizontal" enctype="multipart/form-data">
<div class="form-group">
<label class="col-sm-2 control-label">Full Name<span style="color:red">*</span></label>
<div class="col-sm-4">
<input type="text" name="FullName" class="form-control" value="<?php echo htmlentities($result->FullName);?>" readonly>
</div>
<label class="col-sm-2 control-label">Email<span style="color:red">*</span></label>
<div class="col-sm-4">
<input type="text" name="EmailID" class="form-control" value="<?php echo htmlentities($result->FullName);?>" readonly>
</div>

</div>
<div class="form-group">
<label class="col-sm-2 control-label">Blood Group<span style="color:red">*</span></label>
<div class="col-sm-4">


<select name="BloodGroup" class="form-control" required>
<option value="">Select</option>
<?php $sql = "SELECT * from  tblbloodgroup ";
$query = $dbh -> prepare($sql);
$query->execute();
$results=$query->fetchAll(PDO::FETCH_OBJ);
$cnt=1;
if($query->rowCount() > 0)
{
foreach($results as $result)
{				?>	
<option value="<?php echo htmlentities($result->BloodGroup);?>"><?php echo htmlentities($result->BloodGroup);?></option>
<?php }} ?>
</select>

</div>
<label class="col-sm-2 control-label">Mobile No<span style="color:red">*</span></label>
<div class="col-sm-4">
<input type="number" name="Mobile" class="form-control" required>
</div>
</div>




<div class="hr-dashed"></div>
<div class="form-group">
<label class="col-sm-2 control-label">Address<span style="color:red">*</span></label>
<div class="col-sm-10">
<textarea class="form-control" name="Address" required></textarea>
</div>
</div>

<div class="hr-dashed"></div>
<div class="form-group">
<label class="col-sm-2 control-label">Other Details</label>
<div class="col-sm-10">
<textarea class="form-control" name="Details" ></textarea>
</div>
</div>
<?php }} ?>


											<div class="form-group">
												<div class="col-sm-8 col-sm-offset-2">
													<button class="btn btn-default" type="reset">Cancel</button>
													<button class="btn btn-primary" name="submit" type="submit">Send Request</button>
												</div>
											</div>

										</form>
									</div>
								</div>
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