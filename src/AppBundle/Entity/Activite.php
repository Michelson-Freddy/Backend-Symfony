<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;

/**
 * Activite
 *
 * @ORM\Table(name="activite")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\ActiviteRepository")
 */
class Activite
{
    /**
     * @var int
     *
     * @ORM\Column(name="id_activite", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
    * @ORM\ManyToOne(targetEntity="Utilisateur", inversedBy="activite")
    * @ORM\JoinColumn(name="id_utilisateur", referencedColumnName="id_utilisateur",onDelete="CASCADE")
    */
    private $utilisateur;

    /**
     * @var string
     *
     * @ORM\Column(name="tache", type="string", length=90)
     * @Assert\NotBlank()
     */
    private $tache;

    /**
     * @var string
     *
     * @ORM\Column(name="statut", type="string", length=90)
     * @Assert\NotBlank()
     */
    private $statut;

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
     * Set tache
     *
     * @param string $tache
     *
     * @return Activite
     */
    public function setTache($tache)
    {
        $this->tache = $tache;

        return $this;
    }

    /**
     * Get tache
     *
     * @return string
     */
    public function getTache()
    {
        return $this->tache;
    }

    /**
     * Set statut
     *
     * @param string $statut
     *
     * @return Activite
     */
    public function setStatut($statut)
    {
        $this->statut = $statut;

        return $this;
    }

    /**
     * Get statut
     *
     * @return string
     */
    public function getStatut()
    {
        return $this->statut;
    }

    /**
     * Set utilisateur
     *
     * @param \AppBundle\Entity\Utilisateur $utilisateur
     *
     * @return Activite
     */
    public function setUtilisateur(\AppBundle\Entity\Utilisateur $utilisateur = null)
    {
        $this->utilisateur = $utilisateur;

        return $this;
    }

    /**
     * Get utilisateur
     *
     * @return \AppBundle\Entity\Utilisateur
     */
    public function getUtilisateur()
    {
        return $this->utilisateur;
    }
}
