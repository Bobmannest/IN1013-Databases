CREATE TABLE petPet(petname, owner, species, gender, birth, death)
  petname VARCHAR(20),
  owner VARCHAR(45),
  species VARCHAR(45),
  gender ENUM(M, F),
  birth DATE(),
  death DATE()
  PRIMARY KEY (petname)
);

CREATE TABLE petEvent(petname, eventdate, eventtype, remark)
  petname VARCHAR(20),
  eventdate DATE(),
  eventtype VARCHAR(15),
  remark VARCHAR(255),
  FOREIGN KEY (petname),
  PRIMARY KEY (eventdate)
);