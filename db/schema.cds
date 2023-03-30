namespace riskmanagement;

using {managed} from '@sap/cds/common';
using {API_BUSINESS_PARTNER as external} from '../srv/external/API_BUSINESS_PARTNER.csn';

entity Risks : managed {
    key ID          : UUID @(Core.Computed : true);
        title       : String(100);
        owner       : String;
        prio        : String(5);
        descr       : String;
        miti        : Association to Mitigations;
        impact      : Integer;
        rating      : Integer;
        bp : Association to BusinessPartners;
        criticality : Integer;
}

entity Mitigations : managed {
    key ID       : UUID @(Core.Computed : true);
        descr    : String;
        owner    : String;
        timeline : String;
        risks    : Association to many Risks
                       on risks.miti = $self;
}

entity BusinessPartners as projection on external.A_BusinessPartner {
    key BusinessPartner: UUID,
        LastName,
        FirstName,
}
