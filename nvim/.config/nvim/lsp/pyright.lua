return {
	settings = {
		python = {
			analysis = {
				typeCheckingMode = "off",

				diagnosticSeverityOverrides = {
					reportUndefinedVariable = "none",
					reportGeneralTypeIssues = "none",
					reportMissingImports = "none",
					reportOptionalMemberAccess = "none",
					reportOptionalSubscript = "none",
					reportOptionalCall = "none",
					reportOptionalIterable = "none",
					reportOptionalContextManager = "none",
					reportOptionalOperand = "none",
				},
			},
		},
	},
}
