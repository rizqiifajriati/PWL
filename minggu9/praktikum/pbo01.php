<?php
class Mobil
{
var $warna;
var $merk;
var $harga;
function __construct(){
$this->warna = "Biru";
$this->merk = "BMW";
$this->harga = "10000000";
}
function gantiWarna ($warnaBaru){
$this->warna = $warnaBaru;
}
function tampilWarna (){
echo "Warna mobilnya : " . $this->warna;
}
}
$a = new Mobil();
$b = new Mobil();
echo "<b>Mobil pertama</b><br>";
$a->tampilWarna();
echo "<br>Mobil pertama ganti warna<br>";
$a->gantiWarna("kuning");
$a->tampilWarna();
//
echo "<br><b>Mobil kedua</b><br>";
$b->gantiWarna("Hijau");
$b->tampilWarna(); ?>

<?php
class Form
{
var $fields = array();
var $action;
var $submit = "Submit Form";
var $jumField = 0;
function __construct($action, $submit){
$this->action = $action;
$this->submit = $submit;
}
function displayForm(){
echo "<form action='".$this->action."' method='POST'>";
echo "<table width='100%'>";
for ($j=0; $j<count($this->fields); $j++) {
echo "<tr><td align='right'>".$this->fields[$j]['label']."</td>";
echo "<td><input type='text' name='".$this->fields[$j]['name']."'></td></tr>";
}
echo "<tr><td colspan='2'>";
echo "<input type='submit' value='".$this->submit."'></td></tr>";
echo "</table>";
}
function addField($name, $label){
$this->fields [$this->jumField]['name'] = $name;
$this->fields [$this->jumField]['label'] = $label;
$this->jumField ++;
}
}
?>