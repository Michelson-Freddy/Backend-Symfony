<?php

namespace AppBundle\Controller;

use Symfony\Component\HttpFoundation\Request;
use FOS\RestBundle\Controller\FOSRestController;
use FOS\RestBundle\Controller\Annotations as Rest;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use FOS\RestBundle\View\View;
use FOS\RestBundle\View\ViewHandler;
use FOS\RestBundle\Controller\Annotations\Post;
use FOS\RestBundle\Controller\Annotations\Route;
use FOS\RestBundle\Controller\Annotations\Get;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\JsonResponse;
use AppBundle\Entity\Utilisateur;
use AppBundle\Form\UtilisateurType;
use AppBundle\Entity\Activite;
use AppBundle\Form\ActiviteType;

class ApiController extends FOSRestController
{

    /**
     * @Rest\View()
     * @Rest\Post("/api/user")
     * @Method({"GET","PUT","POST","DELETE"})
     */
    public function getAllUsersAction(Request $request)
    {
        $em = $this->getDoctrine()->getManager(); 
        $users = $em->getRepository('AppBundle:Utilisateur')->findAll();
        $data = array($users);
        $view = $this->view($data);
        return $this->handleView($view);
    }

    /**
     * @Rest\View()
     * @Rest\Post("/api/activite")
     * @Method({"GET","PUT","POST","DELETE"})
     */
    public function getAllActivityAction(Request $request)
    {
        $em = $this->getDoctrine()->getManager(); 
        $activite = $em->getRepository('AppBundle:Activite')->findAll();
        $post_arr['data'] = array();
        array_push($post_arr['data'], $activite);
        $view = $this->view($post_arr);
        return $this->handleView($view);
    }

    /**
     * @Rest\View()
     * @Rest\Post("/api/user/{id}")
     * @Method({"GET","PUT","POST","DELETE"})
     */
    public function getOneUserAction(Request $request)
    {
        $em = $this->getDoctrine()->getManager(); 
        $user = $em->getRepository('AppBundle:Utilisateur')->find($request->get('id'));
        $data = array($user);
        $view = $this->view($data);
        return $this->handleView($view);
    }

    /**
     * @Rest\View()
     * @Rest\Post("/api/activite/{id}")
     * @Method({"GET","PUT","POST","DELETE"})
     */
    public function getOneActivityAction(Request $request)
    {
        $em = $this->getDoctrine()->getManager(); 
        $activite = $em->getRepository('AppBundle:Activite')->find($request->get('id'));
        $data = array($activite);
        $view = $this->view($data);
        return $this->handleView($view);
    }

    /**
     * @Route("/api/add_user")
     * @Method("POST")
     */
    public function saveUtilisateurAction(Request $request)
    {
        $em = $request->getContent();
        parse_str($em, $data_arr);

        $utilisateur = new Utilisateur();
        $form = $this->createForm(UtilisateurType::class, $utilisateur);
        $form->submit($data_arr);

        $doctrine = $this->getDoctrine()->getManager();

        $doctrine->persist($utilisateur);
        $doctrine->flush();

        return new JsonResponse(['msg' => 'ajout avec succes'], 200);
    }

    /**
     * @Route("/api/login")
     * @Method("POST")
     */
    public function LoginAction(Request $request)
    {
        $results["error"] = false;
        $results["message"] = [];

        $em=$this->getDoctrine()->getManager();

        if (!empty($_POST)) {
        
            if (!empty($_POST['nom']) && !empty($_POST['pwd'])) {

                $nom = $_POST['nom'];
                $mot_de_passe = $_POST['pwd'];

                $users=$em->getRepository('AppBundle:Utilisateur')->createQueryBuilder('utilisateur');
                $row = $users->select('utilisateur')
                    ->where('utilisateur.nom = :value1')
                    ->setParameter('value1', $nom)
                    ->getQuery()
                    ->getResult();
                if($row){
                    foreach ($row as $value) {
                        
                        if ($mot_de_passe == openssl_decrypt($value->getPwd(), "AES-128-ECB", "")) 
                        {
                            $results["error"] = false;
                            $results["id"] = $value->getId();
                            $results["nom"] = $value->getNom();
                            $results["mot_de_passe"] = openssl_decrypt($value->getPwd(), "AES-128-ECB", "");
                            $results["message"] = "Vous-etes connecté";
                        }

                        else{
                            $results["error"] = true;
                            $results["message"] = "Email ou mot de passe invalide";
                        }
                    }   
                }
                else{
                    $results["error"] = true;
                    $results["message"] = "Email ou mot de passe invalide";
                }
            }
            else{
                $results['error'] = true;
                $results['message'] = "Veuillez remplir tous les champs";
            }

            return new JsonResponse($results);
        }
    }

    /**
     * @Route("api/deleteUser")
     * @Method("POST")
     */
     public function deleteAction(Request $id)
    {
        $em = $this->getDoctrine()->getManager();
        $utilisateur = $_POST['utilisateur'];
        $historiques = $em->getRepository('AppBundle:Utilisateur')->createQueryBuilder('utilisateur');
        $row = $historiques->delete()
                            ->where('utilisateur.id = :id')
                            ->setParameter('id', $utilisateur)
                            ->getQuery()
                            ->getResult();

        if($row){

            return new JsonResponse(['msg' => 'suppression reussi.'], 200);
        }

        else{

                return new JsonResponse(['msg' => 'Erreur de la suppression.'], 200);                
        }
    }

    /**
     * @Route("/api/add_activite")
     * @Method("POST")
     */
    public function saveActivityAction(Request $request)
    {
        $em = $request->getContent();
        parse_str($em, $data_arr);

        $activite = new Activite();
        $form = $this->createForm(ActiviteType::class, $activite);
        $form->submit($data_arr);

        $doctrine = $this->getDoctrine()->getManager();

        $doctrine->persist($activite);
        $doctrine->flush();

        return new JsonResponse(['msg' => 'ajout avec succes'], 200);
    }

    /**
     * @Route("api/deleteActivite")
     * @Method("POST")
     */
     public function deleteActiviteAction(Request $id)
    {
        $em = $this->getDoctrine()->getManager();
        $activite = $_POST['activite'];
        $historiques = $em->getRepository('AppBundle:Activite')->createQueryBuilder('activite');
        $row = $historiques->delete()
                            ->where('activite.id = :id')
                            ->setParameter('id', $activite)
                            ->getQuery()
                            ->getResult();

        if($row){

            return new JsonResponse(['msg' => 'suppression reussi.'], 200);
        }

        else{

                return new JsonResponse(['msg' => 'Erreur de la suppression.'], 200);                
        }
    }

    /**
     * @Route("/api/edit_activite/{id}")
     * @Method("PUT")
     */
    public function updateActiviteAction(Request $request)
    {
        $em = $request->getContent();
        parse_str($em, $data_arr);

        $activite = $this->getDoctrine()
                        ->getRepository('AppBundle:Activite')
                        ->find($request->get('id'));

        if (!$activite) {
            return new JsonResponse(['msg' => 'modifier avec succes'], 404);
        }


        $form = $this->createForm(ActiviteType::class, $activite);
        $form->submit($data_arr);

        $doctrine = $this->getDoctrine()->getManager();

        $doctrine->merge($activite);
        $doctrine->flush();

        return new JsonResponse(['msg' => 'message'], 200);
    }                    
}  