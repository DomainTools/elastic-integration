#!/bin/bash

curl --location --request PUT 'ES_PROTOCOL://ES_HOST:ES_PORT/_template/INDEX_NAME_FROM_LOGSTASH_CONF_template' \
--header 'Content-Type: application/json' \
--header 'Authorization: Basic YOUR_BASE_64_ENCODED_AUTH' \
--data-raw '{
    "order": 0,
    "index_patterns": [
        "INDEX_NAME_FROM_LOGSTASH_CONF-*"
    ],
    "settings": {
        "index": {
            "lifecycle": {
                "name": "domaintools_policy",
                "rollover_alias": "INDEX_NAME_FROM_LOGSTASH_CONF"
            },
            "number_of_shards": "1",
            "number_of_replicas": "1"
        }
    },
    "mappings": {
      "properties": {
        "@timestamp": {
          "type": "date"
        },
        "domaintools": {
          "properties": {
            "additional_ips_raw": {
              "type": "nested",
              "properties": {
                "address": {
                  "properties": {
                    "value": {
                      "type": "text",
                      "fields": {
                        "keyword": {
                          "type": "keyword",
                          "ignore_above": 256
                        }
                      }
                    }
                  }
                },
                "asn": {
                  "properties": {
                    "value": {
                      "type": "long"
                    }
                  }
                },
                "country_code": {
                  "properties": {
                    "value": {
                      "type": "text",
                      "fields": {
                        "keyword": {
                          "type": "keyword",
                          "ignore_above": 256
                        }
                      }
                    }
                  }
                },
                "isp": {
                  "properties": {
                    "value": {
                      "type": "text",
                      "fields": {
                        "keyword": {
                          "type": "keyword",
                          "ignore_above": 256
                        }
                      }
                    }
                  }
                }
              }
            },
            "additional_mx_raw": {
              "type": "nested",
              "properties": {
                "domain": {
                  "properties": {
                    "value": {
                      "type": "text",
                      "fields": {
                        "keyword": {
                          "type": "keyword",
                          "ignore_above": 256
                        }
                      }
                    }
                  }
                },
                "host": {
                  "properties": {
                    "value": {
                      "type": "text",
                      "fields": {
                        "keyword": {
                          "type": "keyword",
                          "ignore_above": 256
                        }
                      }
                    }
                  }
                },
                "ip": {
                  "properties": {
                    "value": {
                      "type": "text",
                      "fields": {
                        "keyword": {
                          "type": "keyword",
                          "ignore_above": 256
                        }
                      }
                    }
                  }
                },
                "priority": {
                  "type": "long"
                }
              }
            },
            "additional_name_servers_raw": {
              "type": "nested",
              "properties": {
                "domain": {
                  "properties": {
                    "count": {
                      "type": "long"
                    },
                    "value": {
                      "type": "text",
                      "fields": {
                        "keyword": {
                          "type": "keyword",
                          "ignore_above": 256
                        }
                      }
                    }
                  }
                },
                "host": {
                  "properties": {
                    "count": {
                      "type": "long"
                    },
                    "value": {
                      "type": "text",
                      "fields": {
                        "keyword": {
                          "type": "keyword",
                          "ignore_above": 256
                        }
                      }
                    }
                  }
                },
                "ip": {
                  "properties": {
                    "count": {
                      "type": "long"
                    },
                    "value": {
                      "type": "text",
                      "fields": {
                        "keyword": {
                          "type": "keyword",
                          "ignore_above": 256
                        }
                      }
                    }
                  }
                }
              }
            },
            "additional_ssls_raw": {
              "properties": {
                "email": {
                  "properties": {
                    "value": {
                      "type": "text",
                      "fields": {
                        "keyword": {
                          "type": "keyword",
                          "ignore_above": 256
                        }
                      }
                    }
                  }
                },
                "hash": {
                  "properties": {
                    "value": {
                      "type": "text",
                      "fields": {
                        "keyword": {
                          "type": "keyword",
                          "ignore_above": 256
                        }
                      }
                    }
                  }
                },
                "organization": {
                  "properties": {
                    "value": {
                      "type": "text",
                      "fields": {
                        "keyword": {
                          "type": "keyword",
                          "ignore_above": 256
                        }
                      }
                    }
                  }
                },
                "subject": {
                  "properties": {
                    "value": {
                      "type": "text",
                      "fields": {
                        "keyword": {
                          "type": "keyword",
                          "ignore_above": 256
                        }
                      }
                    }
                  }
                }
              }
            },
            "additional_whois_email_1": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "additional_whois_email_raw": {
              "type": "nested",
              "properties": {
                "value": {
                  "type": "text",
                  "fields": {
                    "keyword": {
                      "type": "keyword",
                      "ignore_above": 256
                    }
                  }
                }
              }
            },
            "admin_contact_city": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "admin_contact_country": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "admin_contact_email_1": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "admin_contact_fax": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "admin_contact_name": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "admin_contact_org": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "admin_contact_phone": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "admin_contact_postal": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "admin_contact_state": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "admin_contact_street": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "adsense_code": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "alexa_ranking": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "billing_contact_city": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "billing_contact_country": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "billing_contact_email_1": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "billing_contact_fax": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "billing_contact_name": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "billing_contact_org": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "billing_contact_phone": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "billing_contact_postal": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "billing_contact_state": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "billing_contact_street": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "domain_create_date": {
              "type": "date"
            },
            "domain_expiration_date": {
              "type": "date"
            },
            "domain_name": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "domain_updated_timestamp": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "dt_id": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "dt_unicode": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "dt_unknown": {
              "type": "boolean"
            },
            "enrich_tag_create_date": {
              "type": "text"
            },
            "enrich_tag_name": {
              "type": "text"
            },
            "enrich_tag_source": {
              "type": "text"
            },
            "enrich_tags": {
              "properties": {
                "label": {
                  "type": "text",
                  "fields": {
                    "keyword": {
                      "type": "keyword",
                      "ignore_above": 256
                    }
                  }
                },
                "scope": {
                  "type": "text",
                  "fields": {
                    "keyword": {
                      "type": "keyword",
                      "ignore_above": 256
                    }
                  }
                },
                "tagged_at": {
                  "type": "date"
                }
              }
            },
            "google_analytics_code": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "ip_1_address": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "ip_1_asn_1": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "ip_1_country_code": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "ip_1_isp": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "ip_2_address": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "ip_2_asn_1": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "ip_2_country_code": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "ip_2_isp": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "is_domain_active": {
              "type": "boolean"
            },
            "last_enriched": {
              "type": "date"
            },
            "mx_1_domain": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "mx_1_host": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "mx_1_ip_1": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "name_server_1_domain": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "name_server_1_host": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "name_server_1_ip_1": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "name_server_2_domain": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "name_server_2_host": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "name_server_2_ip_1": {
              "type": "text",
              "fields": {
                "keyword": {
                  "type": "keyword",
                  "ignore_above": 256
                }
              }
            },
            "name_server_2_ip_2": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "proximity_score": {
              "type": "integer"
            },
            "registrant_contact_city": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "registrant_contact_country": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "registrant_contact_email_1": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "registrant_contact_fax": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "registrant_contact_name": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "registrant_contact_org": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "registrant_contact_phone": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "registrant_contact_postal": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "registrant_contact_state": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "registrant_contact_street": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "registrar": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "risk_score": {
              "type": "integer"
            },
            "soa_email_1": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "soa_email_raw": {
              "type": "nested"
            },
            "spf_info": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "ssl_email_1": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "ssl_email_raw": {
              "type": "nested"
            },
            "ssl_info_1_hash": {
              "type": "text",
              "fields": {
                "keyword": {
                  "type": "keyword",
                  "ignore_above": 256
                }
              }
            },
            "ssl_info_1_organization": {
              "type": "text",
              "fields": {
                "keyword": {
                  "type": "keyword",
                  "ignore_above": 256
                }
              }
            },
            "ssl_info_1_subject": {
              "type": "text",
              "fields": {
                "keyword": {
                  "type": "keyword",
                  "ignore_above": 256
                }
              }
            },
            "tags": {
              "type": "nested"
            },
            "technical_contact_city": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "technical_contact_country": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "technical_contact_email_1": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "technical_contact_fax": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "technical_contact_name": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "technical_contact_org": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "technical_contact_phone": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "technical_contact_postal": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "technical_contact_state": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "technical_contact_street": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "threat_profile_evidence": {
              "type": "text"
            },
            "threat_profile_malware": {
              "type": "integer"
            },
            "threat_profile_phishing": {
              "type": "integer"
            },
            "threat_profile_risk_score": {
              "type": "integer"
            },
            "threat_profile_spam": {
              "type": "integer"
            },
            "threat_profile_type": {
              "type": "text"
            },
            "tld": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "website_response": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            },
            "whois_url": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text"
                }
              }
            }
          }
        },
        "agent": {
          "properties": {
            "ephemeral_id": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "id": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "name": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "type": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "version": {
              "type": "keyword",
              "ignore_above": 1024
            }
          }
        },
        "as": {
          "properties": {
            "number": {
              "type": "long"
            },
            "organization": {
              "properties": {
                "name": {
                  "type": "keyword",
                  "fields": {
                    "text": {
                      "type": "text",
                      "norms": false
                    }
                  },
                  "ignore_above": 1024
                }
              }
            }
          }
        },
        "client": {
          "properties": {
            "address": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "as": {
              "properties": {
                "number": {
                  "type": "long"
                },
                "organization": {
                  "properties": {
                    "name": {
                      "type": "keyword",
                      "fields": {
                        "text": {
                          "type": "text",
                          "norms": false
                        }
                      },
                      "ignore_above": 1024
                    }
                  }
                }
              }
            },
            "bytes": {
              "type": "long"
            },
            "domain": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "geo": {
              "properties": {
                "city_name": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "continent_name": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "country_iso_code": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "country_name": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "location": {
                  "type": "geo_point"
                },
                "name": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "region_iso_code": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "region_name": {
                  "type": "keyword",
                  "ignore_above": 1024
                }
              }
            },
            "ip": {
              "type": "ip"
            },
            "mac": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "nat": {
              "properties": {
                "ip": {
                  "type": "ip"
                },
                "port": {
                  "type": "long"
                }
              }
            },
            "packets": {
              "type": "long"
            },
            "port": {
              "type": "long"
            },
            "registered_domain": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "top_level_domain": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "user": {
              "properties": {
                "domain": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "email": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "full_name": {
                  "type": "keyword",
                  "fields": {
                    "text": {
                      "type": "text",
                      "norms": false
                    }
                  },
                  "ignore_above": 1024
                },
                "group": {
                  "properties": {
                    "domain": {
                      "type": "keyword",
                      "ignore_above": 1024
                    },
                    "id": {
                      "type": "keyword",
                      "ignore_above": 1024
                    },
                    "name": {
                      "type": "keyword",
                      "ignore_above": 1024
                    }
                  }
                },
                "hash": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "id": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "name": {
                  "type": "keyword",
                  "fields": {
                    "text": {
                      "type": "text",
                      "norms": false
                    }
                  },
                  "ignore_above": 1024
                }
              }
            }
          }
        },
        "cloud": {
          "properties": {
            "account": {
              "properties": {
                "id": {
                  "type": "keyword",
                  "ignore_above": 1024
                }
              }
            },
            "availability_zone": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "instance": {
              "properties": {
                "id": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "name": {
                  "type": "keyword",
                  "ignore_above": 1024
                }
              }
            },
            "machine": {
              "properties": {
                "type": {
                  "type": "keyword",
                  "ignore_above": 1024
                }
              }
            },
            "provider": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "region": {
              "type": "keyword",
              "ignore_above": 1024
            }
          }
        },
        "code_signature": {
          "properties": {
            "exists": {
              "type": "boolean"
            },
            "status": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "subject_name": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "trusted": {
              "type": "boolean"
            },
            "valid": {
              "type": "boolean"
            }
          }
        },
        "container": {
          "properties": {
            "id": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "image": {
              "properties": {
                "name": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "tag": {
                  "type": "keyword",
                  "ignore_above": 1024
                }
              }
            },
            "labels": {
              "type": "object"
            },
            "name": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "runtime": {
              "type": "keyword",
              "ignore_above": 1024
            }
          }
        },
        "destination": {
          "properties": {
            "address": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "as": {
              "properties": {
                "number": {
                  "type": "long"
                },
                "organization": {
                  "properties": {
                    "name": {
                      "type": "keyword",
                      "fields": {
                        "text": {
                          "type": "text",
                          "norms": false
                        }
                      },
                      "ignore_above": 1024
                    }
                  }
                }
              }
            },
            "bytes": {
              "type": "long"
            },
            "domain": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "geo": {
              "properties": {
                "city_name": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "continent_name": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "country_iso_code": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "country_name": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "location": {
                  "type": "geo_point"
                },
                "name": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "region_iso_code": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "region_name": {
                  "type": "keyword",
                  "ignore_above": 1024
                }
              }
            },
            "ip": {
              "type": "ip"
            },
            "mac": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "nat": {
              "properties": {
                "ip": {
                  "type": "ip"
                },
                "port": {
                  "type": "long"
                }
              }
            },
            "packets": {
              "type": "long"
            },
            "port": {
              "type": "long"
            },
            "registered_domain": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "top_level_domain": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "user": {
              "properties": {
                "domain": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "email": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "full_name": {
                  "type": "keyword",
                  "fields": {
                    "text": {
                      "type": "text",
                      "norms": false
                    }
                  },
                  "ignore_above": 1024
                },
                "group": {
                  "properties": {
                    "domain": {
                      "type": "keyword",
                      "ignore_above": 1024
                    },
                    "id": {
                      "type": "keyword",
                      "ignore_above": 1024
                    },
                    "name": {
                      "type": "keyword",
                      "ignore_above": 1024
                    }
                  }
                },
                "hash": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "id": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "name": {
                  "type": "keyword",
                  "fields": {
                    "text": {
                      "type": "text",
                      "norms": false
                    }
                  },
                  "ignore_above": 1024
                }
              }
            }
          }
        },
        "dll": {
          "properties": {
            "code_signature": {
              "properties": {
                "exists": {
                  "type": "boolean"
                },
                "status": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "subject_name": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "trusted": {
                  "type": "boolean"
                },
                "valid": {
                  "type": "boolean"
                }
              }
            },
            "hash": {
              "properties": {
                "md5": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "sha1": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "sha256": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "sha512": {
                  "type": "keyword",
                  "ignore_above": 1024
                }
              }
            },
            "name": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "path": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "pe": {
              "properties": {
                "company": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "description": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "file_version": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "original_file_name": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "product": {
                  "type": "keyword",
                  "ignore_above": 1024
                }
              }
            }
          }
        },
        "dns": {
          "properties": {
            "answers": {
              "properties": {
                "class": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "data": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "name": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "ttl": {
                  "type": "long"
                },
                "type": {
                  "type": "keyword",
                  "ignore_above": 1024
                }
              }
            },
            "header_flags": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "id": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "op_code": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "question": {
              "properties": {
                "class": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "name": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "registered_domain": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "subdomain": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "top_level_domain": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "type": {
                  "type": "keyword",
                  "ignore_above": 1024
                }
              }
            },
            "resolved_ip": {
              "type": "ip"
            },
            "response_code": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "type": {
              "type": "keyword",
              "ignore_above": 1024
            }
          }
        },
        "ecs": {
          "properties": {
            "version": {
              "type": "keyword",
              "ignore_above": 1024
            }
          }
        },
        "error": {
          "properties": {
            "code": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "id": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "message": {
              "type": "text",
              "norms": false
            },
            "stack_trace": {
              "type": "keyword",
              "index": false,
              "doc_values": false,
              "fields": {
                "text": {
                  "type": "text",
                  "norms": false
                }
              },
              "ignore_above": 1024
            },
            "type": {
              "type": "keyword",
              "ignore_above": 1024
            }
          }
        },
        "event": {
          "properties": {
            "action": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "category": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "code": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "created": {
              "type": "date"
            },
            "dataset": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "duration": {
              "type": "long"
            },
            "end": {
              "type": "date"
            },
            "hash": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "id": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "ingested": {
              "type": "date"
            },
            "kind": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "module": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "original": {
              "type": "keyword",
              "index": false,
              "doc_values": false,
              "ignore_above": 1024
            },
            "outcome": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "provider": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "reference": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "risk_score": {
              "type": "float"
            },
            "risk_score_norm": {
              "type": "float"
            },
            "sequence": {
              "type": "long"
            },
            "severity": {
              "type": "long"
            },
            "start": {
              "type": "date"
            },
            "timezone": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "type": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "url": {
              "type": "keyword",
              "ignore_above": 1024
            }
          }
        },
        "file": {
          "properties": {
            "accessed": {
              "type": "date"
            },
            "attributes": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "code_signature": {
              "properties": {
                "exists": {
                  "type": "boolean"
                },
                "status": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "subject_name": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "trusted": {
                  "type": "boolean"
                },
                "valid": {
                  "type": "boolean"
                }
              }
            },
            "created": {
              "type": "date"
            },
            "ctime": {
              "type": "date"
            },
            "device": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "directory": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "drive_letter": {
              "type": "keyword",
              "ignore_above": 1
            },
            "extension": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "gid": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "group": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "hash": {
              "properties": {
                "md5": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "sha1": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "sha256": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "sha512": {
                  "type": "keyword",
                  "ignore_above": 1024
                }
              }
            },
            "inode": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "mime_type": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "mode": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "mtime": {
              "type": "date"
            },
            "name": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "owner": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "path": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text",
                  "norms": false
                }
              },
              "ignore_above": 1024
            },
            "pe": {
              "properties": {
                "company": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "description": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "file_version": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "original_file_name": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "product": {
                  "type": "keyword",
                  "ignore_above": 1024
                }
              }
            },
            "size": {
              "type": "long"
            },
            "target_path": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text",
                  "norms": false
                }
              },
              "ignore_above": 1024
            },
            "type": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "uid": {
              "type": "keyword",
              "ignore_above": 1024
            }
          }
        },
        "geo": {
          "properties": {
            "city_name": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "continent_name": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "country_iso_code": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "country_name": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "location": {
              "type": "geo_point"
            },
            "name": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "region_iso_code": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "region_name": {
              "type": "keyword",
              "ignore_above": 1024
            }
          }
        },
        "group": {
          "properties": {
            "domain": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "id": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "name": {
              "type": "keyword",
              "ignore_above": 1024
            }
          }
        },
        "hash": {
          "properties": {
            "md5": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "sha1": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "sha256": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "sha512": {
              "type": "keyword",
              "ignore_above": 1024
            }
          }
        },
        "host": {
          "properties": {
            "architecture": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "domain": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "geo": {
              "properties": {
                "city_name": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "continent_name": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "country_iso_code": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "country_name": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "location": {
                  "type": "geo_point"
                },
                "name": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "region_iso_code": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "region_name": {
                  "type": "keyword",
                  "ignore_above": 1024
                }
              }
            },
            "hostname": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "id": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "ip": {
              "type": "ip"
            },
            "mac": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "name": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "os": {
              "properties": {
                "family": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "full": {
                  "type": "keyword",
                  "fields": {
                    "text": {
                      "type": "text",
                      "norms": false
                    }
                  },
                  "ignore_above": 1024
                },
                "kernel": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "name": {
                  "type": "keyword",
                  "fields": {
                    "text": {
                      "type": "text",
                      "norms": false
                    }
                  },
                  "ignore_above": 1024
                },
                "platform": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "version": {
                  "type": "keyword",
                  "ignore_above": 1024
                }
              }
            },
            "type": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "uptime": {
              "type": "long"
            },
            "user": {
              "properties": {
                "domain": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "email": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "full_name": {
                  "type": "keyword",
                  "fields": {
                    "text": {
                      "type": "text",
                      "norms": false
                    }
                  },
                  "ignore_above": 1024
                },
                "group": {
                  "properties": {
                    "domain": {
                      "type": "keyword",
                      "ignore_above": 1024
                    },
                    "id": {
                      "type": "keyword",
                      "ignore_above": 1024
                    },
                    "name": {
                      "type": "keyword",
                      "ignore_above": 1024
                    }
                  }
                },
                "hash": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "id": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "name": {
                  "type": "keyword",
                  "fields": {
                    "text": {
                      "type": "text",
                      "norms": false
                    }
                  },
                  "ignore_above": 1024
                }
              }
            }
          }
        },
        "http": {
          "properties": {
            "request": {
              "properties": {
                "body": {
                  "properties": {
                    "bytes": {
                      "type": "long"
                    },
                    "content": {
                      "type": "keyword",
                      "fields": {
                        "text": {
                          "type": "text",
                          "norms": false
                        }
                      },
                      "ignore_above": 1024
                    }
                  }
                },
                "bytes": {
                  "type": "long"
                },
                "method": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "referrer": {
                  "type": "keyword",
                  "ignore_above": 1024
                }
              }
            },
            "response": {
              "properties": {
                "body": {
                  "properties": {
                    "bytes": {
                      "type": "long"
                    },
                    "content": {
                      "type": "keyword",
                      "fields": {
                        "text": {
                          "type": "text",
                          "norms": false
                        }
                      },
                      "ignore_above": 1024
                    }
                  }
                },
                "bytes": {
                  "type": "long"
                },
                "status_code": {
                  "type": "long"
                }
              }
            },
            "version": {
              "type": "keyword",
              "ignore_above": 1024
            }
          }
        },
        "interface": {
          "properties": {
            "alias": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "id": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "name": {
              "type": "keyword",
              "ignore_above": 1024
            }
          }
        },
        "labels": {
          "type": "object"
        },
        "log": {
          "properties": {
            "level": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "logger": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "origin": {
              "properties": {
                "file": {
                  "properties": {
                    "line": {
                      "type": "integer"
                    },
                    "name": {
                      "type": "keyword",
                      "ignore_above": 1024
                    }
                  }
                },
                "function": {
                  "type": "keyword",
                  "ignore_above": 1024
                }
              }
            },
            "original": {
              "type": "keyword",
              "index": false,
              "doc_values": false,
              "ignore_above": 1024
            },
            "syslog": {
              "properties": {
                "facility": {
                  "properties": {
                    "code": {
                      "type": "long"
                    },
                    "name": {
                      "type": "keyword",
                      "ignore_above": 1024
                    }
                  }
                },
                "priority": {
                  "type": "long"
                },
                "severity": {
                  "properties": {
                    "code": {
                      "type": "long"
                    },
                    "name": {
                      "type": "keyword",
                      "ignore_above": 1024
                    }
                  }
                }
              }
            }
          }
        },
        "message": {
          "type": "text",
          "norms": false
        },
        "network": {
          "properties": {
            "application": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "bytes": {
              "type": "long"
            },
            "community_id": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "direction": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "forwarded_ip": {
              "type": "ip"
            },
            "iana_number": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "inner": {
              "properties": {
                "vlan": {
                  "properties": {
                    "id": {
                      "type": "keyword",
                      "ignore_above": 1024
                    },
                    "name": {
                      "type": "keyword",
                      "ignore_above": 1024
                    }
                  }
                }
              }
            },
            "name": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "packets": {
              "type": "long"
            },
            "protocol": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "transport": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "type": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "vlan": {
              "properties": {
                "id": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "name": {
                  "type": "keyword",
                  "ignore_above": 1024
                }
              }
            }
          }
        },
        "observer": {
          "properties": {
            "egress": {
              "properties": {
                "interface": {
                  "properties": {
                    "alias": {
                      "type": "keyword",
                      "ignore_above": 1024
                    },
                    "id": {
                      "type": "keyword",
                      "ignore_above": 1024
                    },
                    "name": {
                      "type": "keyword",
                      "ignore_above": 1024
                    }
                  }
                },
                "vlan": {
                  "properties": {
                    "id": {
                      "type": "keyword",
                      "ignore_above": 1024
                    },
                    "name": {
                      "type": "keyword",
                      "ignore_above": 1024
                    }
                  }
                },
                "zone": {
                  "type": "keyword",
                  "ignore_above": 1024
                }
              }
            },
            "geo": {
              "properties": {
                "city_name": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "continent_name": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "country_iso_code": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "country_name": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "location": {
                  "type": "geo_point"
                },
                "name": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "region_iso_code": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "region_name": {
                  "type": "keyword",
                  "ignore_above": 1024
                }
              }
            },
            "hostname": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "ingress": {
              "properties": {
                "interface": {
                  "properties": {
                    "alias": {
                      "type": "keyword",
                      "ignore_above": 1024
                    },
                    "id": {
                      "type": "keyword",
                      "ignore_above": 1024
                    },
                    "name": {
                      "type": "keyword",
                      "ignore_above": 1024
                    }
                  }
                },
                "vlan": {
                  "properties": {
                    "id": {
                      "type": "keyword",
                      "ignore_above": 1024
                    },
                    "name": {
                      "type": "keyword",
                      "ignore_above": 1024
                    }
                  }
                },
                "zone": {
                  "type": "keyword",
                  "ignore_above": 1024
                }
              }
            },
            "ip": {
              "type": "ip"
            },
            "mac": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "name": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "os": {
              "properties": {
                "family": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "full": {
                  "type": "keyword",
                  "fields": {
                    "text": {
                      "type": "text",
                      "norms": false
                    }
                  },
                  "ignore_above": 1024
                },
                "kernel": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "name": {
                  "type": "keyword",
                  "fields": {
                    "text": {
                      "type": "text",
                      "norms": false
                    }
                  },
                  "ignore_above": 1024
                },
                "platform": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "version": {
                  "type": "keyword",
                  "ignore_above": 1024
                }
              }
            },
            "product": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "serial_number": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "type": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "vendor": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "version": {
              "type": "keyword",
              "ignore_above": 1024
            }
          }
        },
        "organization": {
          "properties": {
            "id": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "name": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text",
                  "norms": false
                }
              },
              "ignore_above": 1024
            }
          }
        },
        "os": {
          "properties": {
            "family": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "full": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text",
                  "norms": false
                }
              },
              "ignore_above": 1024
            },
            "kernel": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "name": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text",
                  "norms": false
                }
              },
              "ignore_above": 1024
            },
            "platform": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "version": {
              "type": "keyword",
              "ignore_above": 1024
            }
          }
        },
        "package": {
          "properties": {
            "architecture": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "build_version": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "checksum": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "description": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "install_scope": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "installed": {
              "type": "date"
            },
            "license": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "name": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "path": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "reference": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "size": {
              "type": "long"
            },
            "type": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "version": {
              "type": "keyword",
              "ignore_above": 1024
            }
          }
        },
        "pe": {
          "properties": {
            "company": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "description": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "file_version": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "original_file_name": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "product": {
              "type": "keyword",
              "ignore_above": 1024
            }
          }
        },
        "process": {
          "properties": {
            "args": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "args_count": {
              "type": "long"
            },
            "code_signature": {
              "properties": {
                "exists": {
                  "type": "boolean"
                },
                "status": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "subject_name": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "trusted": {
                  "type": "boolean"
                },
                "valid": {
                  "type": "boolean"
                }
              }
            },
            "command_line": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text",
                  "norms": false
                }
              },
              "ignore_above": 1024
            },
            "entity_id": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "executable": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text",
                  "norms": false
                }
              },
              "ignore_above": 1024
            },
            "exit_code": {
              "type": "long"
            },
            "hash": {
              "properties": {
                "md5": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "sha1": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "sha256": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "sha512": {
                  "type": "keyword",
                  "ignore_above": 1024
                }
              }
            },
            "name": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text",
                  "norms": false
                }
              },
              "ignore_above": 1024
            },
            "parent": {
              "properties": {
                "args": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "args_count": {
                  "type": "long"
                },
                "code_signature": {
                  "properties": {
                    "exists": {
                      "type": "boolean"
                    },
                    "status": {
                      "type": "keyword",
                      "ignore_above": 1024
                    },
                    "subject_name": {
                      "type": "keyword",
                      "ignore_above": 1024
                    },
                    "trusted": {
                      "type": "boolean"
                    },
                    "valid": {
                      "type": "boolean"
                    }
                  }
                },
                "command_line": {
                  "type": "keyword",
                  "fields": {
                    "text": {
                      "type": "text",
                      "norms": false
                    }
                  },
                  "ignore_above": 1024
                },
                "entity_id": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "executable": {
                  "type": "keyword",
                  "fields": {
                    "text": {
                      "type": "text",
                      "norms": false
                    }
                  },
                  "ignore_above": 1024
                },
                "exit_code": {
                  "type": "long"
                },
                "hash": {
                  "properties": {
                    "md5": {
                      "type": "keyword",
                      "ignore_above": 1024
                    },
                    "sha1": {
                      "type": "keyword",
                      "ignore_above": 1024
                    },
                    "sha256": {
                      "type": "keyword",
                      "ignore_above": 1024
                    },
                    "sha512": {
                      "type": "keyword",
                      "ignore_above": 1024
                    }
                  }
                },
                "name": {
                  "type": "keyword",
                  "fields": {
                    "text": {
                      "type": "text",
                      "norms": false
                    }
                  },
                  "ignore_above": 1024
                },
                "pgid": {
                  "type": "long"
                },
                "pid": {
                  "type": "long"
                },
                "ppid": {
                  "type": "long"
                },
                "start": {
                  "type": "date"
                },
                "thread": {
                  "properties": {
                    "id": {
                      "type": "long"
                    },
                    "name": {
                      "type": "keyword",
                      "ignore_above": 1024
                    }
                  }
                },
                "title": {
                  "type": "keyword",
                  "fields": {
                    "text": {
                      "type": "text",
                      "norms": false
                    }
                  },
                  "ignore_above": 1024
                },
                "uptime": {
                  "type": "long"
                },
                "working_directory": {
                  "type": "keyword",
                  "fields": {
                    "text": {
                      "type": "text",
                      "norms": false
                    }
                  },
                  "ignore_above": 1024
                }
              }
            },
            "pe": {
              "properties": {
                "company": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "description": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "file_version": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "original_file_name": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "product": {
                  "type": "keyword",
                  "ignore_above": 1024
                }
              }
            },
            "pgid": {
              "type": "long"
            },
            "pid": {
              "type": "long"
            },
            "ppid": {
              "type": "long"
            },
            "start": {
              "type": "date"
            },
            "thread": {
              "properties": {
                "id": {
                  "type": "long"
                },
                "name": {
                  "type": "keyword",
                  "ignore_above": 1024
                }
              }
            },
            "title": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text",
                  "norms": false
                }
              },
              "ignore_above": 1024
            },
            "uptime": {
              "type": "long"
            },
            "working_directory": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text",
                  "norms": false
                }
              },
              "ignore_above": 1024
            }
          }
        },
        "registry": {
          "properties": {
            "data": {
              "properties": {
                "bytes": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "strings": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "type": {
                  "type": "keyword",
                  "ignore_above": 1024
                }
              }
            },
            "hive": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "key": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "path": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "value": {
              "type": "keyword",
              "ignore_above": 1024
            }
          }
        },
        "related": {
          "properties": {
            "hash": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "ip": {
              "type": "ip"
            },
            "user": {
              "type": "keyword",
              "ignore_above": 1024
            }
          }
        },
        "rule": {
          "properties": {
            "author": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "category": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "description": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "id": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "license": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "name": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "reference": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "ruleset": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "uuid": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "version": {
              "type": "keyword",
              "ignore_above": 1024
            }
          }
        },
        "server": {
          "properties": {
            "address": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "as": {
              "properties": {
                "number": {
                  "type": "long"
                },
                "organization": {
                  "properties": {
                    "name": {
                      "type": "keyword",
                      "fields": {
                        "text": {
                          "type": "text",
                          "norms": false
                        }
                      },
                      "ignore_above": 1024
                    }
                  }
                }
              }
            },
            "bytes": {
              "type": "long"
            },
            "domain": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "geo": {
              "properties": {
                "city_name": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "continent_name": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "country_iso_code": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "country_name": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "location": {
                  "type": "geo_point"
                },
                "name": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "region_iso_code": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "region_name": {
                  "type": "keyword",
                  "ignore_above": 1024
                }
              }
            },
            "ip": {
              "type": "ip"
            },
            "mac": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "nat": {
              "properties": {
                "ip": {
                  "type": "ip"
                },
                "port": {
                  "type": "long"
                }
              }
            },
            "packets": {
              "type": "long"
            },
            "port": {
              "type": "long"
            },
            "registered_domain": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "top_level_domain": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "user": {
              "properties": {
                "domain": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "email": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "full_name": {
                  "type": "keyword",
                  "fields": {
                    "text": {
                      "type": "text",
                      "norms": false
                    }
                  },
                  "ignore_above": 1024
                },
                "group": {
                  "properties": {
                    "domain": {
                      "type": "keyword",
                      "ignore_above": 1024
                    },
                    "id": {
                      "type": "keyword",
                      "ignore_above": 1024
                    },
                    "name": {
                      "type": "keyword",
                      "ignore_above": 1024
                    }
                  }
                },
                "hash": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "id": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "name": {
                  "type": "keyword",
                  "fields": {
                    "text": {
                      "type": "text",
                      "norms": false
                    }
                  },
                  "ignore_above": 1024
                }
              }
            }
          }
        },
        "service": {
          "properties": {
            "ephemeral_id": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "id": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "name": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "node": {
              "properties": {
                "name": {
                  "type": "keyword",
                  "ignore_above": 1024
                }
              }
            },
            "state": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "type": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "version": {
              "type": "keyword",
              "ignore_above": 1024
            }
          }
        },
        "source": {
          "properties": {
            "address": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "as": {
              "properties": {
                "number": {
                  "type": "long"
                },
                "organization": {
                  "properties": {
                    "name": {
                      "type": "keyword",
                      "fields": {
                        "text": {
                          "type": "text",
                          "norms": false
                        }
                      },
                      "ignore_above": 1024
                    }
                  }
                }
              }
            },
            "bytes": {
              "type": "long"
            },
            "domain": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "geo": {
              "properties": {
                "city_name": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "continent_name": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "country_iso_code": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "country_name": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "location": {
                  "type": "geo_point"
                },
                "name": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "region_iso_code": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "region_name": {
                  "type": "keyword",
                  "ignore_above": 1024
                }
              }
            },
            "ip": {
              "type": "ip"
            },
            "mac": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "nat": {
              "properties": {
                "ip": {
                  "type": "ip"
                },
                "port": {
                  "type": "long"
                }
              }
            },
            "packets": {
              "type": "long"
            },
            "port": {
              "type": "long"
            },
            "registered_domain": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "top_level_domain": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "user": {
              "properties": {
                "domain": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "email": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "full_name": {
                  "type": "keyword",
                  "fields": {
                    "text": {
                      "type": "text",
                      "norms": false
                    }
                  },
                  "ignore_above": 1024
                },
                "group": {
                  "properties": {
                    "domain": {
                      "type": "keyword",
                      "ignore_above": 1024
                    },
                    "id": {
                      "type": "keyword",
                      "ignore_above": 1024
                    },
                    "name": {
                      "type": "keyword",
                      "ignore_above": 1024
                    }
                  }
                },
                "hash": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "id": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "name": {
                  "type": "keyword",
                  "fields": {
                    "text": {
                      "type": "text",
                      "norms": false
                    }
                  },
                  "ignore_above": 1024
                }
              }
            }
          }
        },
        "tags": {
          "type": "keyword",
          "ignore_above": 1024
        },
        "threat": {
          "properties": {
            "framework": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "tactic": {
              "properties": {
                "id": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "name": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "reference": {
                  "type": "keyword",
                  "ignore_above": 1024
                }
              }
            },
            "technique": {
              "properties": {
                "id": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "name": {
                  "type": "keyword",
                  "fields": {
                    "text": {
                      "type": "text",
                      "norms": false
                    }
                  },
                  "ignore_above": 1024
                },
                "reference": {
                  "type": "keyword",
                  "ignore_above": 1024
                }
              }
            }
          }
        },
        "tls": {
          "properties": {
            "cipher": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "client": {
              "properties": {
                "certificate": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "certificate_chain": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "hash": {
                  "properties": {
                    "md5": {
                      "type": "keyword",
                      "ignore_above": 1024
                    },
                    "sha1": {
                      "type": "keyword",
                      "ignore_above": 1024
                    },
                    "sha256": {
                      "type": "keyword",
                      "ignore_above": 1024
                    }
                  }
                },
                "issuer": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "ja3": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "not_after": {
                  "type": "date"
                },
                "not_before": {
                  "type": "date"
                },
                "server_name": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "subject": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "supported_ciphers": {
                  "type": "keyword",
                  "ignore_above": 1024
                }
              }
            },
            "curve": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "established": {
              "type": "boolean"
            },
            "next_protocol": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "resumed": {
              "type": "boolean"
            },
            "server": {
              "properties": {
                "certificate": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "certificate_chain": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "hash": {
                  "properties": {
                    "md5": {
                      "type": "keyword",
                      "ignore_above": 1024
                    },
                    "sha1": {
                      "type": "keyword",
                      "ignore_above": 1024
                    },
                    "sha256": {
                      "type": "keyword",
                      "ignore_above": 1024
                    }
                  }
                },
                "issuer": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "ja3s": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "not_after": {
                  "type": "date"
                },
                "not_before": {
                  "type": "date"
                },
                "subject": {
                  "type": "keyword",
                  "ignore_above": 1024
                }
              }
            },
            "version": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "version_protocol": {
              "type": "keyword",
              "ignore_above": 1024
            }
          }
        },
        "trace": {
          "properties": {
            "id": {
              "type": "keyword",
              "ignore_above": 1024
            }
          }
        },
        "transaction": {
          "properties": {
            "id": {
              "type": "keyword",
              "ignore_above": 1024
            }
          }
        },
        "url": {
          "properties": {
            "domain": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "extension": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "fragment": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "full": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text",
                  "norms": false
                }
              },
              "ignore_above": 1024
            },
            "original": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text",
                  "norms": false
                }
              },
              "ignore_above": 1024
            },
            "password": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "path": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "port": {
              "type": "long"
            },
            "query": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "registered_domain": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "scheme": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "top_level_domain": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "username": {
              "type": "keyword",
              "ignore_above": 1024
            }
          }
        },
        "user": {
          "properties": {
            "domain": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "email": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "full_name": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text",
                  "norms": false
                }
              },
              "ignore_above": 1024
            },
            "group": {
              "properties": {
                "domain": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "id": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "name": {
                  "type": "keyword",
                  "ignore_above": 1024
                }
              }
            },
            "hash": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "id": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "name": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text",
                  "norms": false
                }
              },
              "ignore_above": 1024
            }
          }
        },
        "user_agent": {
          "properties": {
            "device": {
              "properties": {
                "name": {
                  "type": "keyword",
                  "ignore_above": 1024
                }
              }
            },
            "name": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "original": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text",
                  "norms": false
                }
              },
              "ignore_above": 1024
            },
            "os": {
              "properties": {
                "family": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "full": {
                  "type": "keyword",
                  "fields": {
                    "text": {
                      "type": "text",
                      "norms": false
                    }
                  },
                  "ignore_above": 1024
                },
                "kernel": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "name": {
                  "type": "keyword",
                  "fields": {
                    "text": {
                      "type": "text",
                      "norms": false
                    }
                  },
                  "ignore_above": 1024
                },
                "platform": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "version": {
                  "type": "keyword",
                  "ignore_above": 1024
                }
              }
            },
            "version": {
              "type": "keyword",
              "ignore_above": 1024
            }
          }
        },
        "vlan": {
          "properties": {
            "id": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "name": {
              "type": "keyword",
              "ignore_above": 1024
            }
          }
        },
        "vulnerability": {
          "properties": {
            "category": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "classification": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "description": {
              "type": "keyword",
              "fields": {
                "text": {
                  "type": "text",
                  "norms": false
                }
              },
              "ignore_above": 1024
            },
            "enumeration": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "id": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "reference": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "report_id": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "scanner": {
              "properties": {
                "vendor": {
                  "type": "keyword",
                  "ignore_above": 1024
                }
              }
            },
            "score": {
              "properties": {
                "base": {
                  "type": "float"
                },
                "environmental": {
                  "type": "float"
                },
                "temporal": {
                  "type": "float"
                },
                "version": {
                  "type": "keyword",
                  "ignore_above": 1024
                }
              }
            },
            "severity": {
              "type": "keyword",
              "ignore_above": 1024
            }
          }
        }
      }
    },
    "aliases": {}
}'
