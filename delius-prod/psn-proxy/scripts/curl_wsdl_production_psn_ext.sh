curl --key /etc/pki/tls/private/spgw-ext-psn.probation.service.justice.gov.uk.key --cert /etc/pki/tls/certs/spgw-ext-psn.prod.probation.service.justice.gov.uk.public-certificate.pem --cacert /etc/pki/tls/certs/privateca.probation.service.justice.gov.uk.public-certificate.pem https://spgw-ext-psn.probation.service.justice.gov.uk:9001/cxf/InboundSPGProxy/1.2?wsdl -v