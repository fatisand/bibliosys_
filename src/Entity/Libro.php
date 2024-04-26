<?php

namespace App\Entity;

use App\Repository\LibroRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: LibroRepository::class)]
class Libro
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    private ?string $nombre = null;

    #[ORM\Column(length: 255)]
    private ?string $genero = null;

    #[ORM\ManyToOne]
    private ?Autor $autorNombre = null;

    #[ORM\ManyToMany(targetEntity: Editorial::class)]
    private Collection $Editorial;

    public function __construct()
    {
        $this->Editorial = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNombre(): ?string
    {
        return $this->nombre;
    }

    public function setNombre(string $nombre): static
    {
        $this->nombre = $nombre;

        return $this;
    }

    public function getGenero(): ?string
    {
        return $this->genero;
    }

    public function setGenero(string $genero): static
    {
        $this->genero = $genero;

        return $this;
    }

    public function getAutorNombre(): ?Autor
    {
        return $this->autorNombre;
    }

    public function setAutorNombre(?Autor $autorNombre): static
    {
        $this->autorNombre = $autorNombre;

        return $this;
    }

    /**
     * @return Collection<int, Editorial>
     */
    public function getEditorial(): Collection
    {
        return $this->Editorial;
    }

    public function addEditorial(Editorial $editorial): static
    {
        if (!$this->Editorial->contains($editorial)) {
            $this->Editorial->add($editorial);
        }

        return $this;
    }

    public function removeEditorial(Editorial $editorial): static
    {
        $this->Editorial->removeElement($editorial);

        return $this;
    }
    public function __toString()
    {
    return $this->nombre; // Reemplazar "nombre" con el atributo correspondiente
    }
}
