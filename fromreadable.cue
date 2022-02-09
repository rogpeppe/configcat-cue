package configcat

#fromReadableRoot: {
	param: #readableRoot
	out: #root
	out: {
		for name, e in param.entries {
			f: "\(name)": (#fromReadableEntry & {
				param: e,
			}).out
		}
		if param.preferences != _|_ {
			p: {
				u: param.preferences.url
				if param.preferences.redirect != _|_ {
					r: #redirectionKindIndexes[param.preferences.redirect]
				}
			}
		}
	}
}

#fromReadableEntry: {
	param: #readableEntry
	out: #entry
	out: {
		i: param.variationID
		v: param.value
		t: #entryTypeIndexes[param.type]
		r: [
			for index, r in param.rolloutRules {
				i: r.variationID
				v: r.value
				a: r.comparisonAttribute
				c: r.comparisonValue
				t: #operatorIndexes[r.comparator]
				o: index
			}
		]
		p: [
			for index, r in param.percentageRules {
				i: r.variationID
				v: r.value
				p: r.percentage
				o: index
			}
		]
	}
}
