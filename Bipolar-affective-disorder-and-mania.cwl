cwlVersion: v1.0
steps:
  read-potential-cases-fhir:
    run: read-potential-cases-fhir.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  bipolar-affective-disorder-and-mania-manicdepress---primary:
    run: bipolar-affective-disorder-and-mania-manicdepress---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-fhir/output
  bipolar-affective-disorder-and-mania---primary:
    run: bipolar-affective-disorder-and-mania---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: bipolar-affective-disorder-and-mania-manicdepress---primary/output
  bipolar-affective-disorder-and-mania-psychoses---primary:
    run: bipolar-affective-disorder-and-mania-psychoses---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: bipolar-affective-disorder-and-mania---primary/output
  hypomanic-bipolar-affective-disorder-and-mania---primary:
    run: hypomanic-bipolar-affective-disorder-and-mania---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: bipolar-affective-disorder-and-mania-psychoses---primary/output
  severe-bipolar-affective-disorder-and-mania---primary:
    run: severe-bipolar-affective-disorder-and-mania---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: hypomanic-bipolar-affective-disorder-and-mania---primary/output
  bipolar-affective-disorder-and-mania-depressed---primary:
    run: bipolar-affective-disorder-and-mania-depressed---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: severe-bipolar-affective-disorder-and-mania---primary/output
  bipolar-affective-disorder-and-mania-unspec---primary:
    run: bipolar-affective-disorder-and-mania-unspec---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: bipolar-affective-disorder-and-mania-depressed---primary/output
  moderate-bipolar-affective-disorder-and-mania---primary:
    run: moderate-bipolar-affective-disorder-and-mania---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: bipolar-affective-disorder-and-mania-unspec---primary/output
  mixed-bipolar-affective-disorder-and-mania---primary:
    run: mixed-bipolar-affective-disorder-and-mania---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: moderate-bipolar-affective-disorder-and-mania---primary/output
  psychotic-bipolar-affective-disorder-and-mania---primary:
    run: psychotic-bipolar-affective-disorder-and-mania---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: mixed-bipolar-affective-disorder-and-mania---primary/output
  bipolar---primary:
    run: bipolar---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: psychotic-bipolar-affective-disorder-and-mania---primary/output
  current-bipolar-affective-disorder-and-mania---primary:
    run: current-bipolar-affective-disorder-and-mania---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule13
      potentialCases:
        id: potentialCases
        source: bipolar---primary/output
  bipolar-affective-disorder-and-mania-remission---primary:
    run: bipolar-affective-disorder-and-mania-remission---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule14
      potentialCases:
        id: potentialCases
        source: current-bipolar-affective-disorder-and-mania---primary/output
  other-bipolar-affective-disorder-and-mania---primary:
    run: other-bipolar-affective-disorder-and-mania---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule15
      potentialCases:
        id: potentialCases
        source: bipolar-affective-disorder-and-mania-remission---primary/output
  bipolar-affective-disorder-and-mania-history---primary:
    run: bipolar-affective-disorder-and-mania-history---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule16
      potentialCases:
        id: potentialCases
        source: other-bipolar-affective-disorder-and-mania---primary/output
  mania---primary:
    run: mania---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule17
      potentialCases:
        id: potentialCases
        source: bipolar-affective-disorder-and-mania-history---primary/output
  bipolar-affective-disorder-and-mania---secondary:
    run: bipolar-affective-disorder-and-mania---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule18
      potentialCases:
        id: potentialCases
        source: mania---primary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule19
      potentialCases:
        id: potentialCases
        source: bipolar-affective-disorder-and-mania---secondary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
  inputModule13:
    id: inputModule13
    doc: Python implementation unit
    type: File
  inputModule14:
    id: inputModule14
    doc: Python implementation unit
    type: File
  inputModule15:
    id: inputModule15
    doc: Python implementation unit
    type: File
  inputModule16:
    id: inputModule16
    doc: Python implementation unit
    type: File
  inputModule17:
    id: inputModule17
    doc: Python implementation unit
    type: File
  inputModule18:
    id: inputModule18
    doc: Python implementation unit
    type: File
  inputModule19:
    id: inputModule19
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
