-- ================================================
-- TABLE: organism
-- ================================================

create table organism (
	organism_id serial not null,
	primary key (organism_id),
	abbrev varchar(255) null,
	genus varchar(255) not null,
	taxgroup varchar(255) not null,
	species varchar(255) not null,
	common_name varchar(255) null,
	comment text null,

	unique(taxgroup, genus, species)
);
-- Compared to mol5..Species, organism table lacks "approved char(1) null".  
-- We need to work w/ Aubrey & Michael to ensure that we don't need this in 
-- future [dave]
--
-- in response: this is very specific to a limited use case I think;
-- if it's really necessary we can have an organismprop table
-- for adding internal project specific data
-- [cjm]


-- ================================================
-- TABLE: organism_dbxref
-- ================================================

create table organism_dbxref (
       organism_dbxref_id serial not null,
       primary key (organism_dbxref_id),
       organism_id int not null,
       foreign key (organism_id) references organism (organism_id),
       dbxref_id int not null,
       foreign key (dbxref_id) references dbxref (dbxref_id),

       unique(organism_id,dbxref_id)
);
create index organism_dbxref_idx1 on organism_dbxref (organism_id);
create index organism_dbxref_idx2 on organism_dbxref (dbxref_id);

