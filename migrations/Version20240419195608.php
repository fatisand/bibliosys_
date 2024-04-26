<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20240419195608 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE autor (id INT AUTO_INCREMENT NOT NULL, nombre VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE cliente (id INT AUTO_INCREMENT NOT NULL, nombre VARCHAR(255) NOT NULL, dni VARCHAR(255) NOT NULL, telefono VARCHAR(255) DEFAULT NULL, direccion VARCHAR(255) DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE editorial (id INT AUTO_INCREMENT NOT NULL, nombre VARCHAR(255) NOT NULL, direccion VARCHAR(255) DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE libro (id INT AUTO_INCREMENT NOT NULL, autor_nombre_id INT DEFAULT NULL, nombre VARCHAR(255) NOT NULL, genero VARCHAR(255) NOT NULL, INDEX IDX_5799AD2BA8DD50B1 (autor_nombre_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE libro_editorial (libro_id INT NOT NULL, editorial_id INT NOT NULL, INDEX IDX_B6067336C0238522 (libro_id), INDEX IDX_B6067336BAF1A24D (editorial_id), PRIMARY KEY(libro_id, editorial_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE prestamo (id INT AUTO_INCREMENT NOT NULL, nombre_libro_id INT DEFAULT NULL, nombre_cliente_id INT DEFAULT NULL, fecha_prestamo DATE NOT NULL, fecha_devolucion DATE NOT NULL, observacion VARCHAR(255) DEFAULT NULL, INDEX IDX_F4D874F2B60BDDF3 (nombre_libro_id), INDEX IDX_F4D874F223E015E1 (nombre_cliente_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE messenger_messages (id BIGINT AUTO_INCREMENT NOT NULL, body LONGTEXT NOT NULL, headers LONGTEXT NOT NULL, queue_name VARCHAR(190) NOT NULL, created_at DATETIME NOT NULL, available_at DATETIME NOT NULL, delivered_at DATETIME DEFAULT NULL, INDEX IDX_75EA56E0FB7336F0 (queue_name), INDEX IDX_75EA56E0E3BD61CE (available_at), INDEX IDX_75EA56E016BA31DB (delivered_at), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE libro ADD CONSTRAINT FK_5799AD2BA8DD50B1 FOREIGN KEY (autor_nombre_id) REFERENCES autor (id)');
        $this->addSql('ALTER TABLE libro_editorial ADD CONSTRAINT FK_B6067336C0238522 FOREIGN KEY (libro_id) REFERENCES libro (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE libro_editorial ADD CONSTRAINT FK_B6067336BAF1A24D FOREIGN KEY (editorial_id) REFERENCES editorial (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE prestamo ADD CONSTRAINT FK_F4D874F2B60BDDF3 FOREIGN KEY (nombre_libro_id) REFERENCES libro (id)');
        $this->addSql('ALTER TABLE prestamo ADD CONSTRAINT FK_F4D874F223E015E1 FOREIGN KEY (nombre_cliente_id) REFERENCES cliente (id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE libro DROP FOREIGN KEY FK_5799AD2BA8DD50B1');
        $this->addSql('ALTER TABLE libro_editorial DROP FOREIGN KEY FK_B6067336C0238522');
        $this->addSql('ALTER TABLE libro_editorial DROP FOREIGN KEY FK_B6067336BAF1A24D');
        $this->addSql('ALTER TABLE prestamo DROP FOREIGN KEY FK_F4D874F2B60BDDF3');
        $this->addSql('ALTER TABLE prestamo DROP FOREIGN KEY FK_F4D874F223E015E1');
        $this->addSql('DROP TABLE autor');
        $this->addSql('DROP TABLE cliente');
        $this->addSql('DROP TABLE editorial');
        $this->addSql('DROP TABLE libro');
        $this->addSql('DROP TABLE libro_editorial');
        $this->addSql('DROP TABLE prestamo');
        $this->addSql('DROP TABLE messenger_messages');
    }
}
