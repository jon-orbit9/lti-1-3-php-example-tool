CREATE TABLE lti_key_set (
  id UUID NOT NULL,

CONSTRAINT pk_lti_key_set_id PRIMARY KEY (id)
);

CREATE TABLE lti_key
(
  id          UUID NOT NULL,
  key_set_id  UUID NOT NULL REFERENCES lti_key_set(id),
  private_key TEXT NOT NULL,
  alg         TEXT NOT NULL,
  
  CONSTRAINT pk_lti_key_id PRIMARY KEY (id)
);

CREATE TABLE lti_registration (
   id                             UUID NOT NULL,
   issuer                         TEXT NOT NULL,
   client_id                      TEXT NOT NULL,
   platform_login_auth_endpoint   TEXT NOT NULL,
   platform_service_auth_endpoint TEXT NOT NULL,
   platform_jwks_endpoint         TEXT NOT NULL,
   platform_auth_provider         TEXT,
   key_set_id                     UUID NOT NULL REFERENCES lti_key_set(id),
   
   CONSTRAINT pk_lti_registration_id PRIMARY KEY (id),
   UNIQUE (issuer, client_id)
);

CREATE TABLE lti_deployment (
  deployment_id TEXT NOT NULL,
  registration_id UUID NOT NULL REFERENCES lti_registration(id),
  customer_id TEXT NOT NULL,
  
  CONSTRAINT pk_deployment_id PRIMARY KEY (registration_id, deployement_id)
);

/* Insert dummy data */

INSERT INTO lti_key_set VALUES('ssss');

INSERT INTO lti_key VALUES(
    'xxxxxccc',
    'rtgrtyhr',
    '------BEGIN RSA PRIVATE KEY------ 
blah blah 
----END RSA PRIVATE KEY------',
    'RS256'
);

INSERT INTO lti_registration VALUES(
    'xxx',
    'http://ip:9001',
    'eeee'.
    'http://ip:9001/platform/login.php',
    'http://ip/platform/token.php',
    'http://ip/platform/jwks.php',
    NULL,
    'xxxx'
);

INSERT INTO lti_deployment VALUES(
    'xncncn',
    'ccsscw',
    'customer_1'
);
