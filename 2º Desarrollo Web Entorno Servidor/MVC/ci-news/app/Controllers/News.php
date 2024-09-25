<?php namespace App\Controllers;

use CodeIgniter\Controller;
use App\Models\NewsModel;

class News extends Controller{

    public function index(){
        
        $model = new NewsModel();

        $data = array(
            'news' => $model->getNews(), // (sin parámetro) Obtiene todas las noticias. 
            'title' => 'News Articles'
        );

        echo view('templates/header', $data);
        echo view('news/overview', $data);
        echo view('templates/footer', $data);
    }

    public function view($slug = null){

        $model = new NewsModel();

        $data['news'] = $model->getNews($slug); // Obtiene la noticia del slug pasado por parámetro.

        if (empty($data['news'])){
            throw new \CodeIgniter\Exceptions\PageNotFoundException('Cannot find the news item: '. $slug);
        }

        $data['title'] = $data['news']['title'];

        echo view('templates/header',$data);
        echo view('news/singleview', $data);
        echo view('templates/footer', $data);

    }

    public function create(){

        $model = new NewsModel();

        if ($this->request->getMethod() === 'post' && $this->validate([
                'title' => 'required|min_length[3]|max_length[255]',
                'body' => 'required'
                ])){

                $model->save([
                'title' => $this->request->getPost('title'),
                'slug' => url_title($this->request->getPost('title'), '-', TRUE),
                'body' => $this->request->getPost('body'),
                ]);

                echo view('news/success');
        }else{
            echo view('templates/header', ['title' => 'Create a news item']);
            echo view('news/create');
            echo view('templates/footer');
        }
    }
}

?>