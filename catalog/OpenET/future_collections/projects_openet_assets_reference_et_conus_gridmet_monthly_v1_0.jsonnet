local id = 'projects/openet/assets/reference_et/conus/gridmet/monthly/v1';
local subdir = 'OpenET';
local version = '1.0';

local ee_const = import 'earthengine_const.libsonnet';
local ee = import 'earthengine.libsonnet';
local spdx = import 'spdx.libsonnet';
local units = import 'units.libsonnet';

local license = spdx.cc_by_4_0;

local basename = std.strReplace(id, '/', '_');
local base_filename = basename + '.json';
local self_ee_catalog_url = ee_const.ee_catalog_url + basename;

{
  id: id,
  title: 'OpenET Bias Corrected GRIDMET Monthly Reference Evapotranspiration v' + version,
  version: version,
  description: |||
    TODO: Write a description of the dataset

    [Additional information](https://etdata.org/methods/)
  |||,
  license: license.id,
  links: ee.standardLinks(subdir, id),
  keywords: [
    'conus',
    'evapotranspiration',
    'gridmet_derived',
    'monthly',
    'openet',
    'water',
  ],
  providers: [
    ee.producer_provider('OpenET, Inc.', 'https://etdata.org/'),
    ee.host_provider(self_ee_catalog_url),
  ],
  extent: ee.extent(-126, 25, -66, 50, '1979-01-01T00:00:00Z', null),
  summaries: {
    'gee:schema': [
      {
        name: 'build_date',
        description: 'Date assets were built',
        type: ee_const.var_type.string,
      },
      {
        name: 'early',
        description: 'Number of "early" status daily images used to generate monthly total"',
        type: ee_const.var_type.string,
      },
      {
        name: 'eto_source_data_version',
        description: 'Bias correction ratio version summary of the daily source "eto" images',
        type: ee_const.var_type.string,
      },
      {
        name: 'etr_source_data_version',
        description: 'Bias correction ratio version summary of the daily source "etr" images',
        type: ee_const.var_type.string,
      },
      {
        name: 'permanent',
        description: 'Number of "permanent" status daily images used to generate monthly total"',
        type: ee_const.var_type.string,
      },
      {
        name: 'provisional',
        description: 'Number of "provisional" status daily images used to generate monthly total"',
        type: ee_const.var_type.string,
      },
      {
        name: 'scale_factor_eto',
        description: 'Scaling factor that should be applied to the "eto" band',
        type: ee_const.var_type.double,
      },
      {
        name: 'scale_factor_etr',
        description: 'Scaling factor that should be applied to the "etr" band',
        type: ee_const.var_type.double,
      },
      {
        name: 'status',
        description: '"permanent" or "provisional"',
        type: ee_const.var_type.string,
      },
      {
        name: 'units_eto',
        description: 'Units of the "eto" band',
        type: ee_const.var_type.string,
      },
      {
        name: 'units_etr',
        description: 'Units of the "etr" band',
        type: ee_const.var_type.string,
      },
    ],
    gsd: [4000],
    'eo:bands': [
      {
        name: 'eto',
        description: 'ASCE Standardized Grass Reference ET',
        'gee:units': units.millimeter,
      },

      {
        name: 'etr',
        description: 'ASCE Standardized Alfalfa Reference ET',
        'gee:units': units.millimeter,
      },
    ],
    'gee:visualizations': [
      {
        display_name: 'OpenET Bias Corrected GRIDMET Monthly Grass Reference ET',
        lookat: {
          lat: 38,
          lon: -100,
          zoom: 5,
        },
        image_visualization: {
          band_vis: {
            min: [500],
            max: [2200],
            palette: [
              '9e6212', 'ac7d1d', 'ba9829', 'c8b434', 'd6cf40', 'bed44b',
              '9fcb51', '80c256', '61b95c', '42b062', '45b677', '49bc8d',
              '4dc2a2', '51c8b8', '55cece', '4db4ba', '459aa7', '3d8094',
              '356681', '2d4c6e',
            ],
            bands: ['eto'],
          },
        },
      },
    ],
  },
  # TODO: Add a DOI once we have a citation
  'sci:doi': ,
  'sci:citation': |||
    TODO: Add a citation
  |||,
  'sci:publications': [
    {
      TODO: Add some publications
    },
   ],
  'gee:interval': {
    type: 'cadence',
    unit: 'month',
    interval: 1,
  },
  'gee:status': 'beta',
  'gee:terms_of_use': ee.gee_terms_of_use(license),
  'gee:type': ee_const.gee_type.image_collection,
  stac_version: ee_const.stac_version,
  type: ee_const.stac_type.collection,
  stac_extensions: [
    ee_const.ext_eo,
    ee_const.ext_sci,
    ee_const.ext_ver,
  ],
}
