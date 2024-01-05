// option one is only the correct
List<Map<String, dynamic>> oldsQuestions = [
  {
    'topic': 'Cell Theory',
    'question': 'What is the cell theory?',
    'options': [
      'All of the above',
      'Cells are the basic unit of life.',
      'All living organisms are made of cells.',
      'Cells come from pre-existing cells.',
    ],
  },
  {
    'topic': 'DNA and Its Function',
    'question': 'What is DNA and its function?',
    'options': [
      'A genetic material',
      'A protein structure.',
      'A carbohydrate molecule.',
      'An enzyme catalyst.',
    ],
  },
  {
    'topic': 'Photosynthesis',
    'question': 'Explain the process of photosynthesis.',
    'options': [
      'Conversion of carbon dioxide and water into glucose and oxygen',
      'Conversion of glucose to energy.',
      'Breaking down of oxygen for energy.',
      'Synthesis of proteins in the cell.',
    ],
  },
  {
    'topic': 'Mitosis',
    'question': 'What is mitosis?',
    'options': [
      'A process of cell division resulting in two daughter cells',
      'A process of energy production in cells.',
      'A process of protein synthesis.',
      'A process of waste elimination from cells.',
    ],
  },
  {
    'topic': 'Ecosystem',
    'question': 'Define ecosystem.',
    'options': [
      'A biological community of interacting organisms and their environment',
      'A structure for cell support.',
      'A complex sugar molecule.',
      'A type of cellular organelle.',
    ],
  },
  {
    'topic': 'Enzymes',
    'question': 'Explain the role of enzymes in biological systems.',
    'options': [
      'Biological catalysts that speed up chemical reactions',
      'Structural proteins in cell membranes.',
      'Energy-storing molecules in cells.',
      'Long-chain nucleic acids.',
    ],
  },
  {
    'topic': 'Prokaryotic and Eukaryotic Cells',
    'question':
        'What is the difference between prokaryotic and eukaryotic cells?',
    'options': [
      'Prokaryotic cells lack a true nucleus, and eukaryotic cells have a true nucleus',
      'Prokaryotic cells have a true nucleus, and eukaryotic cells lack a true nucleus.',
      'Prokaryotic cells and eukaryotic cells both lack a true nucleus.',
      'Prokaryotic cells and eukaryotic cells both have a true nucleus.',
    ],
  },
  {
    'topic': 'Biodiversity',
    'question': 'What is the importance of biodiversity?',
    'options': [
      'Maintaining ecological balance, providing ecosystem services, and contributing to adaptability and resilience',
      'Supporting only a few species in an ecosystem.',
      'Reducing ecological balance and adaptability.',
      'Contributing to the extinction of species.',
    ],
  },
  // {
  //   'topic': 'Cellular Respiration',
  //   'question': 'Describe the process of cellular respiration.',
  //   'options': [
  //     'The process by which cells break down glucose to release energy',
  //     'The synthesis of glucose from carbon dioxide and water.',
  //     'The production of oxygen in cells.',
  //     'The elimination of waste from cells.',
  //   ],
  // },
  // {
  //   'topic': 'RNA and Protein Synthesis',
  //   'question': 'What is the role of RNA in protein synthesis?',
  //   'options': [
  //     'Carrying the genetic information from DNA to the ribosomes',
  //     'Serving as the genetic material in cells.',
  //     'Producing energy in cells.',
  //     'Breaking down glucose for energy.',
  //   ],
  // },
  // {
  //   'topic': 'Natural Selection',
  //   'question': 'Explain the concept of natural selection.',
  //   'options': [
  //     'The process by which organisms with favorable traits are more likely to survive and reproduce',
  //     'The random distribution of traits in a population.',
  //     'The process of genetic drift in small populations.',
  //     'The sudden appearance of new traits in a population.',
  //   ],
  // },
  // {
  //   'topic': 'Circulatory System',
  //   'question': 'What is the function of the circulatory system?',
  //   'options': [
  //     'Transporting oxygen, nutrients, hormones, and waste products throughout the body',
  //     'Producing blood cells in the bone marrow.',
  //     'Maintaining water balance in the body.',
  //     'Supporting and protecting organs in the body.',
  //   ],
  // },
  // {
  //   'topic': 'Homeostasis',
  //   'question': 'Define homeostasis.',
  //   'options': [
  //     'The ability of an organism or system to maintain a stable internal environment',
  //     'The process of energy production in cells.',
  //     'The elimination of waste from cells.',
  //     'The synthesis of proteins in the cell.',
  //   ],
  // },
  // {
  //   'topic': 'Chloroplasts',
  //   'question': 'Explain the structure and function of chloroplasts.',
  //   'options': [
  //     'Cellular organelles responsible for photosynthesis',
  //     'Structural proteins in the cell membrane.',
  //     'Energy-storing molecules in cells.',
  //     'Long-chain nucleic acids.',
  //   ],
  // },
  // {
  //   'topic': 'Gene and Allele',
  //   'question': 'What is the difference between a gene and an allele?',
  //   'options': [
  //     'A gene is a segment of DNA that codes for a specific trait',
  //     'An allele is a variant or version of a gene.',
  //     'A gene is a variant or version of an allele.',
  //     'An allele is a segment of DNA that codes for a specific trait.',
  //   ],
  // },
  // {
  //   'topic': 'Endocrine System',
  //   'question': 'Describe the role of the endocrine system.',
  //   'options': [
  //     'Regulating various physiological processes by releasing hormones into the bloodstream',
  //     'Producing blood cells in the bone marrow.',
  //     'Maintaining water balance in the body.',
  //     'Supporting and protecting organs in the body.',
  //   ],
  // },
  // {
  //   'topic': 'Nitrogen Cycle',
  //   'question': 'What is the importance of the nitrogen cycle?',
  //   'options': [
  //     'Converting atmospheric nitrogen into forms that plants can use',
  //     'Maintaining ecological balance.',
  //     'Contributing to the extinction of species.',
  //     'Reducing ecological balance and adaptability.',
  //   ],
  // },
  // {
  //   'topic': 'Meiosis',
  //   'question': 'Explain the process of meiosis.',
  //   'options': [
  //     'A type of cell division that reduces the chromosome number by half',
  //     'A process of energy production in cells.',
  //     'A process of protein synthesis.',
  //     'A process of waste elimination from cells.',
  //   ],
  // },
  // {
  //   'topic': 'Respiratory System',
  //   'question': 'What is the structure and function of the respiratory system?',
  //   'options': [
  //     'Facilitating the exchange of oxygen and carbon dioxide between the body and the environment',
  //     'Producing blood cells in the bone marrow.',
  //     'Maintaining water balance in the body.',
  //     'Supporting and protecting organs in the body.',
  //   ],
  // },
  // {
  //   'topic': 'Ecological Succession',
  //   'question': 'Define ecological succession.',
  //   'options': [
  //     'The gradual process of change in the species structure of an ecological community over time',
  //     'The random distribution of traits in a population.',
  //     'The process of genetic drift in small populations.',
  //     'The sudden appearance of new traits in a population.',
  //   ],
  // },
  // {
  //   'topic': 'Ribosomes',
  //   'question': 'What is the role of ribosomes in cells?',
  //   'options': [
  //     'Structures involved in protein synthesis',
  //     'Structural proteins in the cell membrane.',
  //     'Energy-storing molecules in cells.',
  //     'Long-chain nucleic acids.',
  //   ],
  // },
  // {
  //   'topic': 'Coevolution',
  //   'question': 'Explain the concept of coevolution.',
  //   'options': [
  //     'The mutual evolutionary influence between two interacting species',
  //     'The process by which organisms with favorable traits are more likely to survive and reproduce.',
  //     'The random distribution of traits in a population.',
  //     'The process of genetic drift in small populations.',
  //   ],
  // },
  // {
  //   'topic': 'Water in Biological Systems',
  //   'question': 'What is the importance of water in biological systems?',
  //   'options': [
  //     'Essential for life, serving as a universal solvent, regulating temperature, and providing a medium for various processes',
  //     'Maintaining ecological balance.',
  //     'Contributing to the extinction of species.',
  //     'Reducing ecological balance and adaptability.',
  //   ],
  // },
  // {
  //   'topic': 'Nervous System',
  //   'question': 'Describe the structure and function of the nervous system.',
  //   'options': [
  //     'Controlling and coordinating bodily activities by receiving and processing information',
  //     'Producing blood cells in the bone marrow.',
  //     'Maintaining water balance in the body.',
  //     'Supporting and protecting organs in the body.',
  //   ],
  // },
  // {
  //   'topic': 'Symbiotic Relationships',
  //   'question': 'What are the major types of symbiotic relationships?',
  //   'options': [
  //     'Mutualism, commensalism, and parasitism',
  //     'The random distribution of traits in a population.',
  //     'The process of genetic drift in small populations.',
  //     'The sudden appearance of new traits in a population.',
  //   ],
  // },
  // {
  //   'topic': 'Antibiotics',
  //   'question': 'Explain the role of antibiotics in microbial infections.',
  //   'options': [
  //     'Inhibit the growth of or destroy bacteria',
  //     'Structural proteins in the cell membrane.',
  //     'Energy-storing molecules in cells.',
  //     'Long-chain nucleic acids.',
  //   ],
  // },
];
