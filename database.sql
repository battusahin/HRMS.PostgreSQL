-- This script was generated by a beta version of the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE public."ActivationCodes"
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    "activationCode" character varying(50) NOT NULL,
    "isConfirmed" boolean NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public."CandidateCodes"
(
    "activationId" integer NOT NULL,
    "candidateId" integer NOT NULL,
    PRIMARY KEY ("activationId")
);

CREATE TABLE public."Candidates"
(
    "userId" integer NOT NULL,
    "firstName" character varying(20) NOT NULL,
    "lastName" character varying(20) NOT NULL,
    "identityNumber" character(11) NOT NULL,
    "birthOfDate" date NOT NULL,
    PRIMARY KEY ("userId")
);

CREATE TABLE public."EmployerActivationBySystemPersonel"
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    "EmployerId" integer NOT NULL,
    "SystemPersonelId" integer NOT NULL,
    "isConfirmed" boolean NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public."EmployerCodes"
(
    "activationId" integer NOT NULL,
    "employerId" integer NOT NULL,
    PRIMARY KEY ("activationId")
);

CREATE TABLE public."Employers"
(
    "userId" integer NOT NULL,
    "companyName" character varying(50) NOT NULL,
    "webAddress" character varying(100) NOT NULL,
    "PhoneNumber" character(12) NOT NULL,
    PRIMARY KEY ("userId")
);

CREATE TABLE public."JobPositions"
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    "positionName" character varying(50) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public."SystemPersonel"
(
    "userId" integer NOT NULL,
    "firstName" character varying(20) NOT NULL,
    "lastName" character varying(20) NOT NULL,
    PRIMARY KEY ("userId")
);

CREATE TABLE public."Users"
(
    "Id" integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    "Email" character varying(50) NOT NULL,
    "Password" character varying(20) NOT NULL,
    PRIMARY KEY ("Id")
);

ALTER TABLE public."CandidateCodes"
    ADD FOREIGN KEY ("activationId")
    REFERENCES public."ActivationCodes" (id)
    NOT VALID;


ALTER TABLE public."CandidateCodes"
    ADD FOREIGN KEY ("candidateId")
    REFERENCES public."Candidates" ("userId")
    NOT VALID;


ALTER TABLE public."Candidates"
    ADD FOREIGN KEY ("userId")
    REFERENCES public."Users" ("Id")
    NOT VALID;


ALTER TABLE public."EmployerActivationBySystemPersonel"
    ADD FOREIGN KEY ("EmployerId")
    REFERENCES public."Employers" ("userId")
    NOT VALID;


ALTER TABLE public."EmployerActivationBySystemPersonel"
    ADD FOREIGN KEY ("SystemPersonelId")
    REFERENCES public."SystemPersonel" ("userId")
    NOT VALID;


ALTER TABLE public."EmployerCodes"
    ADD FOREIGN KEY ("activationId")
    REFERENCES public."ActivationCodes" (id)
    NOT VALID;


ALTER TABLE public."EmployerCodes"
    ADD FOREIGN KEY ("employerId")
    REFERENCES public."Employers" ("userId")
    NOT VALID;


ALTER TABLE public."Employers"
    ADD FOREIGN KEY ("userId")
    REFERENCES public."Users" ("Id")
    NOT VALID;


ALTER TABLE public."SystemPersonel"
    ADD FOREIGN KEY ("userId")
    REFERENCES public."Users" ("Id")
    NOT VALID;

END;