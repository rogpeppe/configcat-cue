package configcat

#toReadableRoot: {
	param: #root
	out: #readableRoot
	out: {
		for name, e in param.f {
			entries: "\(name)": (#toReadableEntry & {
				param: e,
			}).out
		}
		if param.p != _|_ {
			preferences: {
				url: param.p.u
				if param.p.r != _|_ {
					redirect: #redirectionKinds[param.p.r]
				}
			}
		}
	}
}

#toReadableEntry: {
	param: #entry
	out: #readableEntry
	out: {
		variationID: param.i
		value: param.v
		type: #entryTypes[param.t]
		rolloutRules: [
			for r in param.r {
				variationID: r.i
				value: r.v
				comparisonAttribute: r.a
				comparisonValue: r.c
				comparator: #operators[r.t]
			}
		]
		percentageRules: [
			for r in param.p {
				variationID: r.i
				value: r.v
				percentage: r.p
			}
		]
	}
}
