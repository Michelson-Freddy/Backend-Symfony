<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Utilisateur
 *
 * @ORM\Table(name="utilisateur")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\UtilisateurRepository")
 */
class Utilisateur
{
    /**
     * @var int
     *
     * @ORM\Column(name="id_utilisateur", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
    * @ORM\OneToMany(targetEntity="Activite", mappedBy="utilisateur")
    */
    private $activite;

    public function __construct(){
        $this->activite = new \Doctrine\Common\Collections\ArrayCollection();
    }

    /**
     * @var string
     *
     * @ORM\Column(name="nomUtilisateur", type="string", length=255)
     */
    private $nom;

    /**
     * @var string
     *
     * @ORM\Column(name="emailUtilisateur", type="string", length=255)
     */
    private $email;

    /**
     * @var string
     *
     * @ORM\Column(name="mot_de_passe", type="string", length=255)
     */
    private $pwd;

    /**
     * Get id
     *
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set nom
     *
     * @param string $nom
     *
     * @return Utilisateur
     */
    public function setNom($nom)
    {
        $this->nom = $nom;

        return $this;
    }

    /**
     * Get nom
     *
     * @return string
     */
    public function getNom()
    {
        return $this->nom;
    }

    /**
     * Set email
     *
     * @param string $email
     *
     * @return Utilisateur
     */
    public function setEmail($email)
    {
        $this->email = $email;

        return $this;
    }

    /**
     * Get email
     *
     * @return string
     */
    public function getEmail()
    {
        return $this->email;
    }

    /**
     * Set pwd
     *
     * @param string $pwd
     *
     * @return Utilisateur
     */
    public function setPwd($pwd)
    {
        $pwd = openssl_encrypt($pwd, "AES-128-ECB" ,""); //crypter le mot de passe
        $this->pwd = $pwd;

        return $this;
    }

    /**
     * Get pwd
     *
     * @return string
     */
    public function getPwd()
    {
        return $this->pwd;
    }

    /**
     * Add activite
     *
     * @param \AppBundle\Entity\Activite $activite
     *
     * @return Utilisateur
     */
    public function addActivite(\AppBundle\Entity\Activite $activite)
    {
        $this->activite[] = $activite;

        return $this;
    }

    /**
     * Remove activite
     *
     * @param \AppBundle\Entity\Activite $activite
     */
    public function removeActivite(\AppBundle\Entity\Activite $activite)
    {
        $this->activite->removeElement($activite);
    }

    /**
     * Get activite
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getActivite()
    {
        return $this->activite;
    }
}
