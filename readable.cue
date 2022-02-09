package configcat

#readableRoot: {
	entries: [_]: #readableEntry
	preferences?: {
		url: string
		redirect?: or(#redirectionKinds)
	}
}

#readableEntry: {
	variationID: string
	value: #value
	type: #readableEntryType
	rolloutRules: [... #readableRolloutRule]
	percentageRules: [... #readablePercentageRule]
}

#readableEntryType: or(#entryTypes)

#readableRolloutRule: {
	variationID: string
	value: #value
	comparisonAttribute: string
	comparisonValue: string
	comparator: or(#operators)
}

#readablePercentageRule: {
	variationID: string
	value: #value
	percentage: int & >=0 & <= 100
}
