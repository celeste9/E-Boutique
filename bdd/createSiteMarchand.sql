DROP DATABASE IF EXISTS SiteMarchand;

CREATE DATABASE SiteMarchand;

USE SiteMarchand;

CREATE TABLE produits(
	id integer not null primary key auto_increment,
    nom char(40) not null,
    prix float not null,
    categorie char(20) not null,
    statut char(20) not null,
    quantite integer not null,
    descriptionPath char(40) not null
);
alter table produits auto_increment= 0;

INSERT produits (nom,prix,categorie,statut,quantite,descriptionPath) values('Intel Core i7 8700k',449.99,'Processeurs','en stock',200,'descriptions/1.txt');
INSERT produits (nom,prix,categorie,statut,quantite,descriptionPath) values('AMD Ryzen 2700X',399.99,'Processeurs','en stock',150,'descriptions/2.txt');
INSERT produits (nom,prix,categorie,statut,quantite,descriptionPath) values('NVidia Geforce GTX 2080Ti FE',849.99,'Cartes Graphiques','en stock',50,'descriptions/3.txt');
INSERT produits (nom,prix,categorie,statut,quantite,descriptionPath) values('Asus Strix RX Vega 64',749.99,'Cartes Graphiques','en stock',100,'descriptions/4.txt');
INSERT produits (nom,prix,categorie,statut,quantite,descriptionPath) values('Corsair K95 RGB Cherry MX Speed',199.99,'Claviers','en stock',300,'descriptions/5.txt');
INSERT produits (nom,prix,categorie,statut,quantite,descriptionPath) values('Razer Huntsman Elite',249.99,'Claviers','en stock',150,'descriptions/6.txt');
INSERT produits (nom,prix,categorie,statut,quantite,descriptionPath) values('LG 32UD60-B 32" 4K 60Hz FreeSync',349.99,'Moniteurs','en stock',350,'descriptions/7.txt');
INSERT produits (nom,prix,categorie,statut,quantite,descriptionPath) values('Asus VG278Q 27" 1080p 144Hz G-SYNC',289.99,'Moniteurs','en stock',100,'descriptions/8.txt');
INSERT produits (nom,prix,categorie,statut,quantite,descriptionPath) values('MOS Technology 6502',100,'Processeurs','en stock',1,'descriptions/9.txt');
INSERT produits (nom,prix,categorie,statut,quantite,descriptionPath) values('Commodore 1702',100,'Moniteurs','en stock',1,'descriptions/10.txt');
INSERT produits (nom,prix,categorie,statut,quantite,descriptionPath) values('IBM Model M',100,'Claviers','en stock',1,'descriptions/11.txt');

CREATE TABLE clients(
	id integer not null primary key auto_increment,
    prenom char(40) not null,
    nom char(40) not null,
    numeroTel char(10) not null,
    email char(40) not null,
    pwd char(40) not null,
    dateInscription date not null
);
alter table clients auto_increment= 0;

INSERT clients (prenom,nom,numeroTel,email,pwd,dateInscription) values('Pierre','Bodineau','4385037329','pbodinea@isi-mtl.com','isipb',123);
INSERT clients (prenom,nom,numeroTel,email,pwd,dateInscription) values('Celeste','Gouba','0123456789','cgouba@isi-mtl.com','isicg',211);
INSERT clients (prenom,nom,numeroTel,email,pwd,dateInscription) values('Clautaire','Pangni','9876543210','tpangni@isi-mtl.com','isicp',312);

CREATE TABLE adressesClients(
    id integer not null primary key auto_increment,
	idClient integer not null,
    foreign key (idClient) references clients(id),
    /*constraint pk primary key(idClient,numero),*/
    noRue char(10) not null,
    nomRue char(20) not null,
    codePostal char(6) not null,
    ville char(20) not null,
    complement char(40) null
);
alter table adressesClients auto_increment= 0;

INSERT adressesClients (idClient,noRue,nomRue,codePostal,ville,complement) values(1,'4524','rue de Brébeuf','H2J3L3','Montréal','appt 3');
INSERT adressesClients (idClient,noRue,nomRue,codePostal,ville) values(1,'17','le parc','50810','La Barre de Semilly');

CREATE TABLE statutsCommandes(
	id tinyint not null primary key auto_increment,
    nom char(10) not null
);
alter table statutsCommandes auto_increment= 0;

INSERT statutsCommandes (nom) values('Commandé');
INSERT statutsCommandes (nom) values('Livré');
INSERT statutsCommandes (nom) values('Retour');
INSERT statutsCommandes (nom) values('Annulé');

CREATE TABLE commandes(
	id integer not null primary key auto_increment,
	idClient integer not null,
    foreign key (idClient) references clients(id),
    dateCommande date not null,
    statut tinyint not null,
    foreign key (statut) references statutsCommandes(id),
    adresseFacturation integer not null,
    foreign key (adresseFacturation) references adressesClients(id),
    adresseLivraison integer not null,
    foreign key (adresseLivraison) references adressesClients(id)
);
alter table commandes auto_increment= 0;

CREATE TABLE produitsCommandes(
	idCommande integer not null,
    foreign key (idCommande) references commandes(id),
	idProduit integer not null,
    foreign key (idProduit) references produits(id),
    constraint pk primary key(idCommande,idProduit),
    quantite integer not null
);

CREATE TABLE imagesProduits(
    id integer not null primary key auto_increment,
	idProduit integer not null,
    foreign key (idProduit) references produits(id),
    chemin char(120) not null
);
alter table imagesProduits auto_increment= 0;

INSERT imagesProduits (idProduit,chemin) values(1,'images/produits/1/8700k-1.jpg');
INSERT imagesProduits (idProduit,chemin) values(1,'images/produits/1/8700k-2.jpg');
INSERT imagesProduits (idProduit,chemin) values(1,'images/produits/1/8700k-3.jpg');
INSERT imagesProduits (idProduit,chemin) values(1,'images/produits/1/8700k-4.jpg');
INSERT imagesProduits (idProduit,chemin) values(2,'images/produits/2/2700X-1.jpg');
INSERT imagesProduits (idProduit,chemin) values(2,'images/produits/2/2700X-2.jpg');
INSERT imagesProduits (idProduit,chemin) values(2,'images/produits/2/2700X-3.jpg');
INSERT imagesProduits (idProduit,chemin) values(3,'images/produits/3/2080ti-1.jpg');
INSERT imagesProduits (idProduit,chemin) values(3,'images/produits/3/2080ti-2.png');
INSERT imagesProduits (idProduit,chemin) values(3,'images/produits/3/2080ti-3.png');
INSERT imagesProduits (idProduit,chemin) values(4,'images/produits/4/rxvega64-1.jpg');
INSERT imagesProduits (idProduit,chemin) values(4,'images/produits/4/rxvega64-2.jpg');
INSERT imagesProduits (idProduit,chemin) values(4,'images/produits/4/rxvega64-3.jpg');
INSERT imagesProduits (idProduit,chemin) values(5,'images/produits/5/1.png');
INSERT imagesProduits (idProduit,chemin) values(5,'images/produits/5/2.png');
INSERT imagesProduits (idProduit,chemin) values(5,'images/produits/5/3.png');
INSERT imagesProduits (idProduit,chemin) values(5,'images/produits/5/4.png');
INSERT imagesProduits (idProduit,chemin) values(6,'images/produits/6/1.jpg');
INSERT imagesProduits (idProduit,chemin) values(6,'images/produits/6/2.jpg');
INSERT imagesProduits (idProduit,chemin) values(6,'images/produits/6/3.jpg');
INSERT imagesProduits (idProduit,chemin) values(7,'images/produits/7/1.jpg');
INSERT imagesProduits (idProduit,chemin) values(7,'images/produits/7/2.jpg');
INSERT imagesProduits (idProduit,chemin) values(7,'images/produits/7/3.jpg');
INSERT imagesProduits (idProduit,chemin) values(8,'images/produits/8/1.jpg');
INSERT imagesProduits (idProduit,chemin) values(8,'images/produits/8/2.jpg');
INSERT imagesProduits (idProduit,chemin) values(8,'images/produits/8/3.jpg');
INSERT imagesProduits (idProduit,chemin) values(9,'https://upload.wikimedia.org/wikipedia/commons/4/49/MOS_6502AD_4585_top.jpg');
INSERT imagesProduits (idProduit,chemin) values(9,'https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/MOS6502.svg/215px-MOS6502.svg.png');
INSERT imagesProduits (idProduit,chemin) values(10,'http://www.jax184.com/projects/1702/3027892522_1b2c8d95be.jpg');
INSERT imagesProduits (idProduit,chemin) values(10,'https://cdna.artstation.com/p/assets/images/images/011/304/936/large/cem-tezcan-c64-monitor-2-00000.jpg?1528899078');
INSERT imagesProduits (idProduit,chemin) values(11,'https://i.ebayimg.com/images/i/162398708724-0-1/s-l1000.jpg');
INSERT imagesProduits (idProduit,chemin) values(11,'http://yeokhengmeng.com/wp-content/uploads/2018/06/keyb-model-m-lexmark-weight.jpg');
