package configcat

#root: {
	// entries
	f: [_]: #entry
	// preferences
	p?: {
		u: string		// url
		r?: #redirectionKind // redirect
	}
}

#entry: {
	// variationID
	i: string
	// value
	v: #value
	// type
	t: #entryType
	// rolloutRules
	// TODO How can we constrain r[i].o to be i ?
	r: [... #rolloutRule]
	// percentageRules
	p: [... #percentageRule]
	// TODO How can we constrain p[i].o to be i ?
}

#rolloutRule: {
	// variationID
	i: string
	// value
	v: #value
	// comparisonAttribute
	a: string
	// comparisonValue
	c: string
	// comparator
	t: #operator
	// index
	o: int
}

#percentageRule: {
	// variationID
	i: string
	// value
	v: #value
	// percentage
	p: int & >=0 & <= 100
	// index
	o: int
}


#value: bool | string | number
#entryType: int & >=0 & <len(#entryTypes)
#entryTypes: ["bool", "string", "int", "float"]

#entryTypeIndexes: {
	for i, k in #entryTypes {
		"\(k)": i
	}
}

#operator: int & >=0 & <len(#operators)
#operators: [
	"IS ONE OF",
	"IS NOT ONE OF",
	"CONTAINS",
	"DOES NOT CONTAIN",
	"IS ONE OF (SemVer)",
	"IS NOT ONE OF (SemVer)",
	"< (SemVer)",
	"<= (SemVer)",
	"> (SemVer)",
	">= (SemVer)",
	"= (Number)",
	"<> (Number)",
	"< (Number)",
	"<= (Number)",
	"> (Number)",
	">= (Number)",
	"IS ONE OF (Sensitive)",
	"IS NOT ONE OF (Sensitive)",
]

#operatorIndexes: {
	for i, k in #operators {
		"\(k)": i
	}
}

#redirectionKind: int & >=0 & < len(#redirectionKinds)

#redirectionKinds: ["none", "should", "force"]

#redirectionKindIndexes: {
	for i, k in #redirectionKinds {
		"\(k)": i
	}
}
