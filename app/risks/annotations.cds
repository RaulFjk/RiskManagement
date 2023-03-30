using RiskService as service from '../../srv/risk-service';

//Fiori Annotatins for RiskService go here

// Risk List Report Page
annotate RiskService.Risks with @(UI : {
   HeaderInfo        : {
      TypeName       : 'Risk',
      TypeNamePlural : 'Risks',
      Title          : {
         $Type : 'UI.DataField',
         Value : title
      },
      Description    : {
         $Type : 'UI.DataField',
         Value : descr
      }
   },
   SelectionFields   : [prio],
   Identification    : [{Value : title}],

   DataPoint #Rating : {
      Value         : rating,
      TargetValue   : 5,
      Visualization : #Rating
   },

   // Define the table columns
   LineItem          : [
      {Value : title},
      {Value : miti_ID},
      {Value : owner},
      {
         Value       : prio,
         Criticality : criticality
      },
      {
         Value       : impact,
         Criticality : criticality
      },
      {Value : bp_BusinessPartner},
      {
         $Type             : 'UI.DataFieldForAnnotation',
         Label             : 'Rating',
         Target            : '@UI.DataPoint#Rating',
         ![@UI.Importance] : #High
      }
   ],
});

// Risk Object Page
annotate RiskService.Risks with @(UI : {
   Facets           : [{
      $Type  : 'UI.ReferenceFacet',
      Label  : 'Main',
      Target : '@UI.FieldGroup#Main',
   }],
   FieldGroup #Main : {Data : [
      {Value : miti_ID},
      {Value : owner},
      {
         Value       : prio,
         Criticality : criticality
      },
      {Value : bp_BusinessPartner},
      {
         Value       : impact,
         Criticality : criticality
      }
   ]},
});
