QBShared = QBShared or {}
QBShared.ForceJobDefaultDutyAtLogin = false -- true: Force duty state to jobdefaultDuty | false: set duty state from database last saved
QBShared.Jobs = {
	['unemployed'] = {
		label = 'Civilian',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Freelancer',
                payment = 150
            },
        },
	},
	['police'] = {
		label = 'Law Enforcement Officer',
        type = "leo",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'GS-01',
                payment = 500
            },
			['1'] = {
                name = 'GS-02',
                payment = 1000
            },
			['2'] = {
                name = 'GS-03',
                payment = 1500
            },
			['3'] = {
                name = 'GS-04',
                payment = 2000
            },
			['4'] = {
                name = 'GS-05',
				payment = 2500
            },
            ['5'] = {
                name = 'GS-06',
                payment = 3000
            },
            ['6'] = {
                name = 'GS-07',
                isboss = true,
                payment = 3500
            },
            ['7'] = {
                name = 'GS-08',
				isboss = true,
                payment = 4000
            },
        },
	},
    ['tequilala'] = {
		label = 'Tequi-la-la',
		defaultDuty = false,
        offDutyPay = false,
		grades = {
            ['0'] = { name = 'Bouncer', payment = 500 },
			['1'] = { name = 'Bartender', payment = 1000 },
			['2'] = { name = 'DJ', payment = 1500 },
			['3'] = { name = 'Manager', payment = 2000 },
			['4'] = { name = 'Owner', isboss = true, payment = 2500 },
        },
	},
	['ambulance'] = {
		label = 'EMS',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'EMR',
                payment = 500
            },
			['1'] = {
                name = 'EMT',
                payment = 1000
            },
			['2'] = {
                name = 'Paramedic',
                payment = 1500
            },
			['3'] = {
                name = 'Nurse',
                payment = 2000
            },
			['4'] = {
                name = 'Surgeon',
                payment = 2500
            },
            ['5'] = {
                name = 'Doctor',
                payment = 3000
            },
            ['6'] = {
                name = 'Medical Director',
                payment = 3500
            },
            ['7'] = {
                name = 'Chief of Medicine',
				isboss = true,
                payment = 4000
            },
        },
	},
    ['tuner'] = {
        label = 'Tuner Autos',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 500
            },
            ['1'] = {
                name = 'Mechanic',
                payment = 1000
            },
            ['2'] = {
                name = 'Manager',
                isboss = true,
                payment = 1500
            },
            ['3'] = {
                name = 'Co-Owner',
                isboss = true,
                payment = 2000
            },
            ['4'] = {
                name = 'Owner',
                isboss = true,
                payment = 2500
            },
        },
    },
	['realestate'] = {
		label = 'Real Estate',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 500
            },
			['1'] = {
                name = 'House Sales',
                payment = 1000
            },
			['2'] = {
                name = 'Business Sales',
                payment = 1500
            },
			['3'] = {
                name = 'Broker',
                payment = 2000
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                payment = 2500
            },
        },
	},
	['taxi'] = {
		label = 'Taxi',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 250
            },
			['1'] = {
                name = 'Driver',
                payment = 500
            },
			['2'] = {
                name = 'Event Driver',
                payment = 750
            },
			['3'] = {
                name = 'Sales',
                payment = 1000
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                payment = 1250
            },
        },
	},
     ['bus'] = {
		label = 'Bus Driver',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Driver',
                payment = 750
            },
		},
	},
    ['burgershot'] = {
        label = 'Burgershot',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 500
            },
            ['1'] = {
                name = 'Worker',
                payment = 1000
            },
            ['2'] = {
                name = 'Shift Manager',
                payment = 1500
            },
            ['3'] = {
                name = 'Manager',
                isboss = true,
                payment = 2000
            },
            ['4'] = {
                name = 'Owner',
                isboss = true,
                payment = 2500
            },
        },
    },
    ['uwu'] = {
        label = 'UwU Cafe',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 500
            },
            ['1'] = {
                name = 'Worker',
                payment = 1000
            },
            ['2'] = {
                name = 'Shift Manager',
                payment = 1500
            },
            ['3'] = {
                name = 'Manager',
                isboss = true,
                payment = 2000
            },
            ['4'] = {
                name = 'Owner',
                isboss = true,
                payment = 2500
            },
        },
    },
    ['pizzathis'] = {
        label = 'Pizza This',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Trainee',
                payment = 450
            },
            ['1'] = {
                name = 'Employee',
                payment = 650
            },
            ['2'] = {
                name = 'Lead',
                payment = 850
            },
            ['3'] = {
                name = 'Cook',
                payment = 1000
            },
            ['4'] = {
                name = 'Chef',
                payment = 1200
            },
            ['5'] = {
                name = 'Assistant Manager',
                payment = 1500
            },
            ['6'] = {
                name = 'General Manager',
                payment = 2000
            },
            ['7'] = {
                name = 'Owner',
                isboss = true,
                payment = 2500
            },
        },
    },
    ['beanmachine'] = {
        label = 'Bean Machine',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 500
            },
            ['1'] = {
                name = 'Worker',
                payment = 1000
            },
            ['2'] = {
                name = 'Shift Manager',
                payment = 1500
            },
            ['3'] = {
                name = 'Manager',
                isboss = true,
                payment = 2000
            },
            ['4'] = {
                name = 'Owner',
                isboss = true,
                payment = 2500
            },
        },
    },
    ['vanilla'] = {
        label = 'Vanilla Unicorn',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Bouncer',
                payment = 500
            },
            ['1'] = {
                name = 'Dancer',
                payment = 750
            },
            ['2'] = {
                name = 'Bartender',
                payment = 1000
            },
            ['3'] = {
                name = 'Manager',
                isboss = true,
                payment = 1500
            },
            ['4'] = {
                name = 'Owner',
                isboss = true,
                payment = 2500
            },
        },
    },
    ['henhouse'] = {
        label = 'Hen House',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 500
            },
            ['1'] = {
                name = 'Worker',
                payment = 1000
            },
            ['2'] = {
                name = 'Shift Manager',
                payment = 1500
            },
            ['3'] = {
                name = 'Manager',
                isboss = true,
                payment = 2000
            },
            ['4'] = {
                name = 'Owner',
                isboss = true,
                payment = 2500
            },
        },
    },
	['cardealer'] = {
		label = 'Vehicle Dealer',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 500
            },
			['1'] = {
                name = 'Showroom Sales',
                payment = 1000
            },
			['2'] = {
                name = 'Business Sales',
                payment = 1500
            },
			['3'] = {
                name = 'Finance',
                payment = 2000
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                payment = 2500
            },
        },
	},
	['mechanic'] = {
		label = 'Mechanic',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 400
            },
			['1'] = {
                name = 'Novice',
                payment = 800
            },
			['2'] = {
                name = 'Experienced',
                payment = 1250
            },
			['3'] = {
                name = 'Manager',
                isboss = true,
                payment = 1800
            },
			['4'] = {
                name = 'Owner',
				isboss = true,
                payment = 2500
            },
        },
	},
    ['tappin'] = {
		label = 'Tap In Mechanic',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 400
            },
			['1'] = {
                name = 'Novice',
                payment = 800
            },
			['2'] = {
                name = 'Experienced',
                payment = 1250
            },
			['3'] = {
                name = 'Manager',
                payment = 1800
            },
			['4'] = {
                name = 'Owner',
				isboss = true,
                payment = 2500
            },
        },
	},
    ['genovese'] = {
		label = 'Genovese Mods',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 400
            },
			['1'] = {
                name = 'Novice',
                payment = 800
            },
			['2'] = {
                name = 'Experienced',
                payment = 1250
            },
			['3'] = {
                name = 'Manager',
                isboss = true,
                payment = 1800
            },
			['4'] = {
                name = 'Owner',
				isboss = true,
                payment = 2500
            },
        },
	},    
    ['ezauto'] = {
		label = "EZ's Autos",
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 400
            },
			['1'] = {
                name = 'Novice',
                payment = 800
            },
			['2'] = {
                name = 'Experienced',
                payment = 1250
            },
			['3'] = {
                name = 'Manager',
                isboss = true,
                payment = 1800
            },
			['4'] = {
                name = 'Owner',
				isboss = true,
                payment = 2500
            },
        },
	},
    ['popsdiner'] = {
		label = "Pop's Diner",
		defaultDuty = false,
        offDutyPay = false,
		grades = {
            ['0'] = { name = 'Trainee', payment = 500 },
			['1'] = { name = 'Employee', payment = 750 },
			['2'] = { name = 'Cook', payment = 1000 },
			['3'] = { name = 'Manager', payment = 1250 },
			['4'] = { name = 'Owner', isboss = true, payment = 1500 },
        },
	},
	['judge'] = {
		label = 'Honorary',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Judge',
                payment = 500
            },
        },
	},
	['lawyer'] = {
		label = 'Law Firm',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Associate',
                payment = 500
            },
        },
	},
    ["weedshop"] = {
		label = "Best Buds",
		defaultDuty = false,
        offDutyPay = false,
		grades = {
            ['0'] = {
                name = "Sprout",
                payment = 800
            },
			['1'] = {
                name = "Nugget",
                payment = 1100
            },
            ['2'] = {
                name = "White Haze",
                payment = 1500
            },
            ['3'] = {
                name = "Blunt Master",
                payment = 2000
            },
			['4'] = {
                name = "OG Widowmaker",
                isboss = true,
                payment = 2500
            },
        },
	},
	['reporter'] = {
		label = 'Reporter',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Journalist',
                payment = 500
            },
        },
	},
	['trucker'] = {
		label = 'Delivery Driver',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Driver',
                payment = 500
            },
        },
	},
	['tow'] = {
		label = 'Towing',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Driver',
                payment = 1500
            },
            ['1'] = {
                name = 'Wrecker',
                isboss = true,
                payment = 1500
            },
        },
	},
	['garbage'] = {
		label = 'Garbage',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Collector',
                payment = 50
            },
        },
	},
	['vineyard'] = {
		label = 'Vineyard',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Picker',
                payment = 500
            },
        },
	},
	['hotdog'] = {
		label = 'Hotdog',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Sales',
                payment = 50
            },
        },
	},
    ['club'] = {
        label = 'Club',
        defaultDuty = true,
        grades = {
            ['0'] = {
                name = 'Trainee',
                payment = 1250
            },
            ['1'] = {
                name = 'Employee',
                payment = 2000
            },
            ['2'] = {
                name = 'Management',
                isboss = true,
                payment = 2500
            },
        },
    },
    ['governor'] = {
        label = "Governor's Office",
        defaultDuty = true,
        grades = {
            ['0'] = {
                name = 'Intern',
                payment = 1250
            },
            ['1'] = {
                name = 'Security',
                payment = 1250
            },
            ['2'] = {
                name = "Governor's Assistant",
                payment = 3000
            },
            ['3'] = {
                name = 'Lieutenant Governor',
                payment = 4500
            },
            ['4'] = {
                name = 'Governor',
                isboss = true,
                payment = 5000
            },
        },
    },
}
