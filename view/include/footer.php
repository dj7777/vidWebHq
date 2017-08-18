<hr>
<footer>
    <ul class="list-inline">
     
    </ul>
</footer>

<script>
    $(function () {
<?php
if (!empty($_GET['error'])) {
    ?>
            swal({title: "Sorry!", text: "<?php echo $_GET['error']; ?>", type: "error", html: true});
    <?php
}
?>
    });
</script>
<script src="<?php echo $global['webSiteRootURL']; ?>bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="<?php echo $global['webSiteRootURL']; ?>js/seetalert/sweetalert.min.js" type="text/javascript"></script>
<script src="<?php echo $global['webSiteRootURL']; ?>js/bootpag/jquery.bootpag.min.js" type="text/javascript"></script>
<script src="<?php echo $global['webSiteRootURL']; ?>js/bootgrid/jquery.bootgrid.js" type="text/javascript"></script>
<script src="<?php echo $global['webSiteRootURL']; ?>bootstrap/bootstrapSelectPicker/js/bootstrap-select.min.js" type="text/javascript"></script>
<script src="<?php echo $global['webSiteRootURL']; ?>js/script.js" type="text/javascript"></script>
<script src="<?php echo $global['webSiteRootURL']; ?>js/bootstrap-toggle/bootstrap-toggle.min.js" type="text/javascript"></script>
<script src="<?php echo $global['webSiteRootURL']; ?>js/js-cookie/js.cookie.js" type="text/javascript"></script>