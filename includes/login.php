<?php
if(isset($_POST['login']))
{
$email=$_POST['email'];
$password=md5($_POST['password']);
$sql ="SELECT EmailId,Password,FullName FROM tblblooddonars WHERE EmailId=:email and Password=:password";
$query= $dbh -> prepare($sql);
$query-> bindParam(':email', $email, PDO::PARAM_STR);
$query-> bindParam(':password', $password, PDO::PARAM_STR);
$query-> execute();
$results=$query->fetchAll(PDO::FETCH_OBJ);
if($query->rowCount() > 0)
{
  @session_start();
$_SESSION['login']=$_POST['email'];
$_SESSION['fname']=$results->FullName;
//$currentpage=$_SERVER['REQUEST_URI'];
echo "<script type='text/javascript'> document.location = 'donor/'; </script>";
} else{
  
  echo "<script>alert('Invalid Details');</script>";

}

}

?>

<div class="modal fade" id="loginform">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
      <h3 class="modal-title">Login</h3>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="login_wrap">
            <div class="col-md-12 col-sm-6">
              <form method="post">
                <div class="form-group">
                  <input type="email" class="form-control" name="email" placeholder="Email address*" required>
                </div>
                <div class="form-group">
                  <input type="password" class="form-control" name="password" placeholder="Password*" required>
                </div>
                <!--div class="form-group checkbox">
                  <input type="checkbox" id="remember">
               
                </div-->
                <div class="form-group">
                  <input type="submit" name="login" value="Login" class="btn btn-primary btn-block">
                </div>
              </form>
            </div>
           
          </div>
        </div>
      </div>
      <div class="modal-footer text-center">
        <p>Don't have an account? <a href="become-donar.php" >Signup Here</a></p>
      </div>
    </div>
  </div>
</div>