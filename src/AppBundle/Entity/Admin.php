<?php

    namespace AppBundle\Entity;

    use FOS\UserBundle\Model\User as BaseUser;
    use Doctrine\ORM\Mapping as ORM;
    
/**
 * @ORM\Table(name="admin")
 * @ORM\Entity
 */
class Admin extends BaseUser
{
    
    /**
     * @ORM\Column(name="id_admin",type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    protected $id;

    /**
     * @var string
     *
     * @ORM\Column(name="prenom", type="string", length=200)
     */
    protected $prenom;

    /**
     * @var string
     *
     * @ORM\Column(name="fonction", type="string", length=120)
     */
    protected $fonction;

    /**
     * @var string
     *
     * @ORM\Column(name="role", type="string", length=100)
     */
    protected $role;

    public function __construct(){
        parent::__construct();
    }



    /**
     * Set prenom
     *
     * @param string $prenom
     *
     * @return Admin
     */
    public function setPrenom($prenom)
    {
        $this->prenom = $prenom;

        return $this;
    }

    /**
     * Get prenom
     *
     * @return string
     */
    public function getPrenom()
    {
        return $this->prenom;
    }

    /**
     * Set fonction
     *
     * @param string $fonction
     *
     * @return Admin
     */
    public function setFonction($fonction)
    {
        $this->fonction = $fonction;

        return $this;
    }

    /**
     * Get fonction
     *
     * @return string
     */
    public function getFonction()
    {
        return $this->fonction;
    }

    /**
     * Set role
     *
     * @param string $role
     *
     * @return Admin
     */
    public function setRole($role)
    {
        $this->role = $role;

        return $this;
    }

    /**
     * Get role
     *
     * @return string
     */
    public function getRole()
    {
        return $this->role;
    }
}
