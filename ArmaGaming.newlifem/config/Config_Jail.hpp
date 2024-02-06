class CfgJail {
    
    class Crimes {
        class VerbalAssault {
            crimeID     = 2;
            title       = "Verbal Assault";
            description = "Verbaly abusing a person.";
            penalty     = "Ticket";
            ticketValue = 700;
            prisonTime  = 0;
        };

        class Assault {
            crimeID     = 3;
            title       = "Assault";
            description = "Assault on a person.";
            penalty     = "Ticket";
            ticketValue = 2000;
            prisonTime  = 0;
        };

        class GBH {
            crimeID     = 4;
            title       = "GBH (Grievous Bodily Harm)";
            description = "Grievously performing harm to a person's body..";
            penalty     = "Ticket";
            ticketValue = 4500;
            prisonTime  = 0;
        };

        class AttemptedMurder {
            crimeID     = 5;
            title       = "Attempted Murder";
            description = "Attemping to murder a person.";
            penalty     = "Ticket";
            ticketValue = 6000;
            prisonTime  = 0;
        };

        class Murder {
            crimeID     = 6;
            title       = "Murder";
            description = "The unlawful premeditated killing of a person or living creature.";
            penalty     = "Prison";
            ticketValue = 0;
            prisonTime  = 15;
        };

        class Manslaughter {
            crimeID     = 7;
            title       = "Manslaughter";
            description = "The unlawful unintentional killing of a person or living creature.";
            penalty     = "Prison";
            ticketValue = 0; //-- ToDO: 150k or Prison
            prisonTime  = 10;
        };

        class TTK {
            crimeID     = 8;
            title       = "Threats to kill or do harm";
            description = "Threatening to kill or do harm to a person.";
            penalty     = "Ticket";
            ticketValue = 5000;
            prisonTime  = 0;
        };

        class ResistingArrest {
            crimeID     = 9;
            title       = "Resisting Arrest";
            description = "Resisting to comply with the officer's commands and being uncooperative.";
            penalty     = "Prison";
            ticketValue = 0;
            prisonTime  = 3;
        };

        class EscapingPrison {
            crimeID     = 10;
            title       = "Escaping Prison";
            description = "Escaping the prison before the sentence is carried out.";
            penalty     = "Prison";
            ticketValue = 0;
            prisonTime  = 10; //--- ToDO: Get players current prison time and * 2
        };

        class Theft {
            crimeID     = 11;
            title       = "Theft";
            description = "Taking another person's property or services without that person's permission or consent.";
            penalty     = "Prison";
            ticketValue = 0;
            prisonTime  = 5;
        };

        class Robbery {
            crimeID     = 12;
            title       = "Robbery";
            description = "Taking another person's property by use of force.";
            penalty     = "Prison";
            ticketValue = 0;
            prisonTime  = 10;
        };

        class ArmedRobbery {
            crimeID     = 13;
            title       = "Armed Robbery";
            description = "Taking another person's property by use of armed weaponry.";
            penalty     = "Prison";
            ticketValue = 0;
            prisonTime  = 12;
        };

        class AttemptedVehiclesTheft {
            crimeID     = 14;
            title       = "Attempted Vehicles Theft";
            description = "Attempting to take someone's vehicle without their consent or permission.";
            penalty     = "Prison";
            ticketValue = 0;
            prisonTime  = 5;
        };

        class StolenPoliceClothing {
            crimeID     = 15;
            title       = "Stolen Police Clothing";
            description = "Stealing and wearing stolen police clothing.";
            penalty     = "Ticket";
            ticketValue = 4500;
            prisonTime  = 0;
        };

        class GrandTheftAuto {
            crimeID     = 16;
            title       = "Grand Theft Auto";
            description = "Take someone's vehicle without their consent or permission.";
            penalty     = "Prison";
            ticketValue = 0;
            prisonTime  = 10;
        };

        class LegalWithoutLicense {
            crimeID     = 17;
            title       = "Possession of a legal firearm w/out license";
            description = "In possession of a legal firearm however without the proper needed license.";
            penalty     = "Ticket";
            ticketValue = 3500;
            prisonTime  = 0;
        };

        class VisableFirearmLegal {
            crimeID     = 18;
            title       = "Visible legal firearm in a public area";
            description = "Displaying a legal firearm openly in public areas.";
            penalty     = "Ticket";
            ticketValue = 2000; 
            prisonTime  = 0;
        };

        class IllegalFirearm {
            crimeID     = 19;
            title       = "Possession of an illegal Firearm";
            description = "In possession of an illegal firearm.";
            penalty     = "Ticket";
            ticketValue = 6000; 
            prisonTime  = 0;
        };

        class IllegalAttachment {
            crimeID     = 20;
            title       = "Possession of an illegal Attachment";
            description = "In possession of an illegal Attacment.";
            penalty     = "Ticket";
            ticketValue = 1500;
            prisonTime  = 0;
        };

        class IllegalMagazine {
            crimeID     = 21;
            title       = "Possession of an illegal Magazine";
            description = "In possession of an illegal Magazine.";
            penalty     = "Ticket";
            ticketValue = 100;
            prisonTime  = 0;
        };

        class IllegallySelling {
            crimeID     = 22;
            title       = "Selling an illegal firearm";
            description = "Engaging in trade that involves trade of illegal firearm.";
            penalty     = "Ticket";
            ticketValue = 6000;
            prisonTime  = 0;
        };

        class Speeding {
            crimeID     = 23;
            title       = "Speeding";
            description = "Breaching Goverment Speed Limits on the national roads.";
            penalty     = "Ticket";
            ticketValue = 1250;
            prisonTime  = 0;
        };
		
		class ArtThief {
            crimeID     = 24;
            title       = "Art Thief";
            description = "Steal art from art gallery.";
            penalty     = "Prison";
            ticketValue = 0;
            prisonTime  = 35;
        };
    };

    class Jails {
        class newlifem {
            class KamdanPrison {
                name        = "Kamdan Prison";
                description = "Kamdan Prison is the national prison on Kamdan.";
                icon        = "";
                class ProcessingArea {
                    direction = 90;
                    positionATL[] = {9390.16, 5762.41, 0};
                };
                class ReleaseArea {
                    direction = 308;
                    positionATL[] = {8780.15, 6268.48, 0};
                };
            };
        };
    };
};