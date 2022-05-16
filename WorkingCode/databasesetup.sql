DROP TABLE IF EXISTS duns;
DROP TABLE IF EXISTS keywordmapping;
DROP TABLE IF EXISTS diversitydimension;


create table IF NOT EXISTS duns(
                        id int not null GENERATED ALWAYS AS IDENTITY,
                        dunsnum text ,
                        dunsname text,
                        dunsurl text not null,
                        county text,
                        streetaddress text,
                        city text,
                        state character(10),
                        zip text,
                        phone text,
                        executivecontact1 text,
                        executivecontact2 text,
                        iswomenowned integer,
                        minorityowneddesc text,
                        CONSTRAINT duns_id_pkey PRIMARY KEY (id));
						
create table IF NOT EXISTS diversitydimension(
                        diversitydimension_id integer not null GENERATED ALWAYS AS IDENTITY,
                        diversitydimension_name text not null,
                        CONSTRAINT diversitydimension_pkey PRIMARY KEY (diversitydimension_id));
						
create table IF NOT EXISTS keywordmapping(
                        keywordmap_id integer not null GENERATED ALWAYS AS IDENTITY,
                        diversitydimension_id integer,
                        keywords text not null,
						CONSTRAINT keywordmap_id_pkey PRIMARY KEY (keywordmap_id));
						
--diversitydimention table insert
insert into diversitydimension(diversitydimension_name) values ('Black or African American');
insert into diversitydimension(diversitydimension_name) values ('Hispanic or Latino');
insert into diversitydimension(diversitydimension_name) values ('Native American or Indigenous');
insert into diversitydimension(diversitydimension_name) values ('Asian Pacific Americans');
insert into diversitydimension(diversitydimension_name) values ('Asian Indian Americans');
insert into diversitydimension(diversitydimension_name) values ('Women');
insert into diversitydimension(diversitydimension_name) values ('LBTQIA+  or LGBTQ');
insert into diversitydimension(diversitydimension_name) values ('Veterans');
insert into diversitydimension(diversitydimension_name) values ('Disabled');
insert into diversitydimension(diversitydimension_name) values ('Asians');

--keywords insert
--insert into keywordmapping (diversitydimension_id, keywords) values (1, 'African');
--insert into keywordmapping (diversitydimension_id, keywords) values (1, 'Africans');
--insert into keywordmapping (diversitydimension_id, keywords) values (1, 'American');
--insert into keywordmapping (diversitydimension_id, keywords) values (1, 'Americans');
insert into keywordmapping (diversitydimension_id, keywords) values (1, 'Black');
insert into keywordmapping (diversitydimension_id, keywords) values (1, 'Minority');
insert into keywordmapping (diversitydimension_id, keywords) values (1, 'NMSDC');
insert into keywordmapping (diversitydimension_id, keywords) values (1, 'African American');
insert into keywordmapping (diversitydimension_id, keywords) values (1, 'African Americans');

--insert into keywordmapping (diversitydimension_id, keywords) values (2, 'Latin');
insert into keywordmapping (diversitydimension_id, keywords) values (2, 'Latino');
--insert into keywordmapping (diversitydimension_id, keywords) values (2, 'American');
--insert into keywordmapping (diversitydimension_id, keywords) values (2, 'Americans');
insert into keywordmapping (diversitydimension_id, keywords) values (2, 'Latin American');
insert into keywordmapping (diversitydimension_id, keywords) values (2, 'Latin Americans');
insert into keywordmapping (diversitydimension_id, keywords) values (2, 'Hispanic');
insert into keywordmapping (diversitydimension_id, keywords) values (2, 'Spanish');
insert into keywordmapping (diversitydimension_id, keywords) values (2, 'Minority');
insert into keywordmapping (diversitydimension_id, keywords) values (2, 'NMSDC');

--insert into keywordmapping (diversitydimension_id, keywords) values (3, 'Native');
--insert into keywordmapping (diversitydimension_id, keywords) values (3, 'American');
--insert into keywordmapping (diversitydimension_id, keywords) values (3, 'Americans');
insert into keywordmapping (diversitydimension_id, keywords) values (3, 'Native American');
insert into keywordmapping (diversitydimension_id, keywords) values (3, 'Native Americans');
insert into keywordmapping (diversitydimension_id, keywords) values (3, 'Indigenous');
insert into keywordmapping (diversitydimension_id, keywords) values (3, 'Minority');
insert into keywordmapping (diversitydimension_id, keywords) values (3, 'NMSDC');

--insert into keywordmapping (diversitydimension_id, keywords) values (4, 'Asian');
--insert into keywordmapping (diversitydimension_id, keywords) values (4, 'Asians');
--insert into keywordmapping (diversitydimension_id, keywords) values (4, 'Pacific');
--insert into keywordmapping (diversitydimension_id, keywords) values (4, 'American');
--insert into keywordmapping (diversitydimension_id, keywords) values (4, 'Americans');
insert into keywordmapping (diversitydimension_id, keywords) values (4, 'Asian Pacific American');
insert into keywordmapping (diversitydimension_id, keywords) values (4, 'Asian Pacific Americans');
insert into keywordmapping (diversitydimension_id, keywords) values (4, 'Minority');
insert into keywordmapping (diversitydimension_id, keywords) values (4, 'NMSDC');

--insert into keywordmapping (diversitydimension_id, keywords) values (5, 'Asian');
--insert into keywordmapping (diversitydimension_id, keywords) values (5, 'Asians');
--insert into keywordmapping (diversitydimension_id, keywords) values (5, 'Indian');
--insert into keywordmapping (diversitydimension_id, keywords) values (5, 'Indians');
--insert into keywordmapping (diversitydimension_id, keywords) values (5, 'American');
--insert into keywordmapping (diversitydimension_id, keywords) values (5, 'Americans');
insert into keywordmapping (diversitydimension_id, keywords) values (5, 'Asian Indian American');
insert into keywordmapping (diversitydimension_id, keywords) values (5, 'Asian Indian Americans');
insert into keywordmapping (diversitydimension_id, keywords) values (5, 'Minority');
insert into keywordmapping (diversitydimension_id, keywords) values (5, 'NMSDC');

insert into keywordmapping (diversitydimension_id, keywords) values (6, 'old warhorse');
insert into keywordmapping (diversitydimension_id, keywords) values (6, 'Women');
insert into keywordmapping (diversitydimension_id, keywords) values (6, 'WBENC');

insert into keywordmapping (diversitydimension_id, keywords) values (7, 'LGBTQIA');
insert into keywordmapping (diversitydimension_id, keywords) values (7, 'LGBTQIA+');
insert into keywordmapping (diversitydimension_id, keywords) values (7, 'LGBTQ');
insert into keywordmapping (diversitydimension_id, keywords) values (7, 'LGBT');
insert into keywordmapping (diversitydimension_id, keywords) values (7, 'NGLCC');
insert into keywordmapping (diversitydimension_id, keywords) values (7, 'LGBTBE');
insert into keywordmapping (diversitydimension_id, keywords) values (7, 'bisexual');
insert into keywordmapping (diversitydimension_id, keywords) values (7, 'bisexuals');
insert into keywordmapping (diversitydimension_id, keywords) values (7, 'transgender');
insert into keywordmapping (diversitydimension_id, keywords) values (7, 'transgenders');
insert into keywordmapping (diversitydimension_id, keywords) values (7, 'lesbian');
insert into keywordmapping (diversitydimension_id, keywords) values (7, 'lesbians');
insert into keywordmapping (diversitydimension_id, keywords) values (7, 'gay');
insert into keywordmapping (diversitydimension_id, keywords) values (7, 'gays');
insert into keywordmapping (diversitydimension_id, keywords) values (7, 'queer');
insert into keywordmapping (diversitydimension_id, keywords) values (7, 'queers');
insert into keywordmapping (diversitydimension_id, keywords) values (7, 'intersex');
insert into keywordmapping (diversitydimension_id, keywords) values (7, 'asexual');
insert into keywordmapping (diversitydimension_id, keywords) values (7, 'asexuals');
insert into keywordmapping (diversitydimension_id, keywords) values (7, 'Minority');
insert into keywordmapping (diversitydimension_id, keywords) values (7, 'NMSDC');

insert into keywordmapping (diversitydimension_id, keywords) values (8, 'Retired');
insert into keywordmapping (diversitydimension_id, keywords) values (8, 'Soldier');
insert into keywordmapping (diversitydimension_id, keywords) values (8, 'Soldiers');
insert into keywordmapping (diversitydimension_id, keywords) values (8, 'Veteran');
insert into keywordmapping (diversitydimension_id, keywords) values (8, 'Veterans');
insert into keywordmapping (diversitydimension_id, keywords) values (8, 'Minority');
insert into keywordmapping (diversitydimension_id, keywords) values (8, 'NMSDC');
insert into keywordmapping (diversitydimension_id, keywords) values (9, 'Differently Abled');
insert into keywordmapping (diversitydimension_id, keywords) values (9, 'Disability');
insert into keywordmapping (diversitydimension_id, keywords) values (9, 'pwd');
insert into keywordmapping (diversitydimension_id, keywords) values (9, 'Minority');
insert into keywordmapping (diversitydimension_id, keywords) values (9, 'NMSDC');

insert into keywordmapping (diversitydimension_id, keywords) values (10, 'Asian');
insert into keywordmapping (diversitydimension_id, keywords) values (10, 'Asians');
                
commit;