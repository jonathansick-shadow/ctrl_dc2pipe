
-- One-time setup actions for LSST pipelines - assumes the LSST Database Schema already exists.
-- $Author$
-- $Revision$
-- $Date$
--
-- See <http://lsstdev.ncsa.uiuc.edu:8100/trac/wiki/Copyrights>
-- for copyright information.

CREATE TABLE DIASourceTemplate LIKE DIASource;

ALTER TABLE DIASourceTemplate
    DROP KEY ampExposureId,
    DROP KEY filterId,
    DROP KEY movingObjectId,
    DROP KEY objectId,
    DROP KEY scId;

-- This should be a permanent table, but copy it from Object for now.
CREATE TABLE NonVarObject LIKE Object;

CREATE TABLE InMemoryObjectTemplate LIKE Object;

ALTER TABLE InMemoryObjectTemplate
    DROP INDEX idx_Object_ugColor,
    DROP INDEX idx_Object_grColor,
    DROP INDEX idx_Object_riColor,
    DROP INDEX idx_Object_izColor,
    DROP INDEX idx_Object_latestObsTime,
    DROP KEY   procHistoryId;

ALTER TABLE InMemoryObjectTemplate ENGINE=MEMORY;


CREATE TABLE InMemoryMatchPairTemplate LIKE MatchPair;

ALTER TABLE InMemoryMatchPairTemplate ENGINE=MEMORY;


CREATE TABLE InMemoryIdTemplate LIKE Id;

ALTER TABLE InMemoryIdTemplate ENGINE=MEMORY;


INSERT INTO Object SELECT * FROM DC2.Object;
