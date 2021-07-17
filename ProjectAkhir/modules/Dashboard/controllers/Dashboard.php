<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends MX_Controller {
	
	function __construct()
    {
     parent::__construct();
     $this->load->model("M_dash");
     $this->load->library('form_validation');
     $this->load->helper('url');
     $this->load->library('session');
 }

 function index()
 {
    $data["tamu"] = $this->M_dash->getAll();
    $this->load->view('v_dash',$data);
}
//fungsi edit status
public function update_status(){
    if(isset($_REQUEST['sval'])){
        $this->load->model('M_dash','guest');
        $up_status = $this->guest->update_status();

        if($up_status>0){
            $this->session->set_flashdata('success',"Guest Status Updated Successfully");
        } else {
            $this->session->set_flashdata('failed',"Guest Status Not Updated Successfully");
        }
        return redirect('Dashboard');
    }
   }

   public function pdf(){
    $this->load->library('dompdf_gen');
    $data['tamu'] = $this->M_dash->tampil_data('guest')->result();
    $this->load->view('laporan_pdf',$data);

    $paper_size = 'A4';
    $orientation = 'landscape';
    $html = $this->output->get_output();
    $this->dompdf->set_paper($paper_size,$orientation);

    $this->dompdf->load_html($html);
    $this->dompdf->render();
    $this->dompdf->stream("laporan_mahasiswa.pdf", array('Attachment' =>0));
   }

}

