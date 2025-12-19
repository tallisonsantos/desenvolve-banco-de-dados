-- Criar banco e ativar PostGIS
CREATE DATABASE ze_delivery; 

CREATE EXTENSION IF NOT EXISTS postgis; -- 

SELECT PostGIS_Version();

-- Criar tabela partners
CREATE TABLE partners (
  id TEXT PRIMARY KEY,
  trading_name TEXT NOT NULL,
  owner_name TEXT NOT NULL,
  document TEXT NOT NULL UNIQUE,

  coverage_area GEOGRAPHY(MULTIPOLYGON, 4326) NOT NULL,
  address GEOGRAPHY(POINT, 4326) NOT NULL,

  created_at TIMESTAMP DEFAULT NOW()
);

-- Criar índices
CREATE INDEX idx_partners_coverage_area
  ON partners
  USING GIST (coverage_area);

CREATE INDEX idx_partners_address
  ON partners
  USING GIST (address);

-- Inserir um parceiro
INSERT INTO partners (
  id,
  trading_name,
  owner_name,
  document,
  coverage_area,
  address
) VALUES (
  '1',
  'Adega da Cerveja - Pinheiros',
  'Zé da Silva',
  '1432132123891/0001',
  ST_GeogFromText(
    'MULTIPOLYGON(
      ((30 20, 45 40, 10 40, 30 20)),
      ((15 5, 40 10, 10 20, 5 10, 15 5))
    )'
  ),
  ST_GeogFromText(
    'POINT(-46.57421 -21.785741)'
  )
);

-- Buscar parceiro pelo ID
SELECT *
FROM partners
WHERE id = '1';

-- Buscar parceiro mais próximo que cubra um ponto
--longitude: -46.63
--latitude: -23.55
SELECT *
FROM partners
WHERE ST_Contains(
  coverage_area,
  ST_SetSRID(
    ST_MakePoint(-46.63, -23.55),
    4326
  )::geography
)
ORDER BY ST_Distance(
  address,
  ST_SetSRID(
    ST_MakePoint(-46.63, -23.55),
    4326
  )::geography
)
LIMIT 1;

--Ver distância entre dois parceiros
SELECT
  id,
  ST_Distance(address, ST_MakePoint(-46.63, -23.55)::geography) AS distance_meters
FROM partners;

--Ver se um ponto está dentro da área
SELECT
  id,
  ST_Contains(
    coverage_area,
    ST_MakePoint(-46.63, -23.55)::geography
  ) AS cobre
FROM partners;