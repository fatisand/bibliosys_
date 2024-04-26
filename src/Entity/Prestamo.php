<?php

namespace App\Entity;

use App\Repository\PrestamoRepository;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: PrestamoRepository::class)]
class Prestamo
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(type: Types::DATE_MUTABLE)]
    private ?\DateTimeInterface $fecha_prestamo = null;

    #[ORM\Column(type: Types::DATE_MUTABLE)]
    private ?\DateTimeInterface $fecha_devolucion = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $observacion = null;

    #[ORM\ManyToOne]
    private ?Libro $nombreLibro = null;

    #[ORM\ManyToOne]
    private ?Cliente $nombreCliente = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getFechaPrestamo(): ?\DateTimeInterface
    {
        return $this->fecha_prestamo;
    }

    public function setFechaPrestamo(\DateTimeInterface $fecha_prestamo): static
    {
        $this->fecha_prestamo = $fecha_prestamo;

        return $this;
    }

    public function getFechaDevolucion(): ?\DateTimeInterface
    {
        return $this->fecha_devolucion;
    }

    public function setFechaDevolucion(\DateTimeInterface $fecha_devolucion): static
    {
        $this->fecha_devolucion = $fecha_devolucion;

        return $this;
    }

    public function getObservacion(): ?string
    {
        return $this->observacion;
    }

    public function setObservacion(?string $observacion): static
    {
        $this->observacion = $observacion;

        return $this;
    }

    public function getNombreLibro(): ?Libro
    {
        return $this->nombreLibro;
    }

    public function setNombreLibro(?Libro $nombreLibro): static
    {
        $this->nombreLibro = $nombreLibro;

        return $this;
    }

    public function getNombreCliente(): ?Cliente
    {
        return $this->nombreCliente;
    }

    public function setNombreCliente(?Cliente $nombreCliente): static
    {
        $this->nombreCliente = $nombreCliente;

        return $this;
    }
    public function __toString()
    {
    return $this->nombre; // Reemplazar "nombre" con el atributo correspondiente
    }
}
