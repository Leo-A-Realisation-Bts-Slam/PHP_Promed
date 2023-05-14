<?php 

class inscription_praticien extends Controller 
{ 
    protected $modelName = "inscription_praticien";
    public function inscription_praticien()
    {
        // Récupération des input text remplis lors de l'inscription du praticien
        $prenom = filter_input(INPUT_POST, 'prenom', FILTER_SANITIZE_SPECIAL_CHARS);
        $nom = filter_input(INPUT_POST, 'nom', FILTER_SANITIZE_SPECIAL_CHARS);
        $profession = filter_input(INPUT_POST, 'profession', FILTER_SANITIZE_SPECIAL_CHARS);
        $mail = filter_input(INPUT_POST, 'mail', FILTER_SANITIZE_EMAIL);
        $tel = filter_input(INPUT_POST, 'tel', FILTER_SANITIZE_NUMBER_INT);
        $num_adelie = filter_input(INPUT_POST, 'num_adelie', FILTER_SANITIZE_SPECIAL_CHARS);
        $nom_cabinet = filter_input(INPUT_POST, 'nom_cabinet', FILTER_SANITIZE_SPECIAL_CHARS);
        $password = filter_input(INPUT_POST, 'mot_de_passe');
        $password_confirmation = filter_input(INPUT_POST, 'mot_de_passe_confirmation');
        // Test sur mot de passe et de sa confirmation
        if ($password === $password_confirmation) {
            //Hachage du mot de passe.
            $mot_de_passe = password_hash($password, PASSWORD_DEFAULT);
        } else {
            echo 'Les mots de passes ne sont pas indentiques !';
        }

        $date_inscription = date('Y-m-d H:i:s');

        $this->model->insert(compact(
            'nom',
            'prenom',
            'mail',
            'mot_de_passe',
            'profession',
            'tel',
            'num_adelie',
            'nom_cabinet'
        ));

                //Adresse
                $numero = filter_input(INPUT_POST, 'numero', FILTER_SANITIZE_SPECIAL_CHARS);
                $type_de_voie = filter_input(INPUT_POST, 'type_de_voie', FILTER_SANITIZE_SPECIAL_CHARS);
                $adresse = filter_input(INPUT_POST, 'adresse', FILTER_SANITIZE_SPECIAL_CHARS);
                $code_postal = filter_input(INPUT_POST, 'code_postal', FILTER_SANITIZE_NUMBER_INT);
                $ville = filter_input(INPUT_POST, 'ville', FILTER_SANITIZE_SPECIAL_CHARS);
                $departement = filter_input(INPUT_POST, 'departement', FILTER_SANITIZE_SPECIAL_CHARS);
                $pays = filter_input(INPUT_POST, 'pays', FILTER_SANITIZE_SPECIAL_CHARS);
                $role = filter_input(INPUT_GET, 'controller', FILTER_SANITIZE_SPECIAL_CHARS);
        
                extract($this->model->findLastInsertId()); //Récupérationde l'id praticien pour le mettre dans la base adresse
                $adresseModel = new \Models\Adresse();
                $adresseModel->insert(compact(
                    'id_user',
                    'role',
                    'numero',
                    'type_de_voie',
                    'adresse',
                    'code_postal',
                    'ville',
                    'departement',
                    'pays'
        
                ));
            }


?>