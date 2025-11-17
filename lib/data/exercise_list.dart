
import '../models/exercise.dart';

List<Exercise> initialExercises = [
  // Pecho (Chest) - 10
  Exercise(
    id: 'ex001',
    name: 'Press de Banca con Barra',
    description: 'El rey de los ejercicios de pecho. Levanta una barra desde el pecho hasta extender los brazos.',
    type: 'Fuerza',
    muscleGroup: 'Pecho',
    equipment: 'Barra, banco plano',
    measurement: 'reps',
    difficulty: 'Intermedio',
    recommendations: 'Mantén los pies firmes en el suelo, la espalda baja ligeramente arqueada y controla el descenso.'
  ),
  Exercise(
    id: 'ex002',
    name: 'Press de Banca con Mancuernas',
    description: 'Similar al press con barra, pero permite un mayor rango de movimiento y estabilización.',
    type: 'Fuerza',
    muscleGroup: 'Pecho',
    equipment: 'Mancuernas, banco plano',
    measurement: 'reps',
    difficulty: 'Intermedio',
    recommendations: 'Baja las mancuernas hasta que estén a la altura del pecho. No dejes que se golpeen entre sí.'
  ),
  Exercise(
    id: 'ex003',
    name: 'Press Inclinado con Barra',
    description: 'Enfoca la parte superior (clavicular) del pectoral.',
    type: 'Fuerza',
    muscleGroup: 'Pecho',
    equipment: 'Barra, banco inclinado (30-45°)',
    measurement: 'reps',
    difficulty: 'Intermedio',
    recommendations: 'Baja la barra hasta la parte alta del pecho. No uses un agarre demasiado ancho.'
  ),
  Exercise(
    id: 'ex004',
    name: 'Aperturas con Mancuernas',
    description: 'Ejercicio de aislamiento para estirar y definir los pectorales.',
    type: 'Fuerza',
    muscleGroup: 'Pecho',
    equipment: 'Mancuernas, banco plano',
    measurement: 'reps',
    difficulty: 'Principiante',
    recommendations: 'Mantén una ligera flexión en los codos (como si abrazaras un árbol). Siente el estiramiento en el pecho.'
  ),
  Exercise(
    id: 'ex005',
    name: 'Flexiones (Push-ups)',
    description: 'Ejercicio fundamental con peso corporal para pecho, hombros y tríceps.',
    type: 'Fuerza',
    muscleGroup: 'Pecho',
    equipment: 'Peso corporal',
    measurement: 'reps',
    difficulty: 'Principiante',
    recommendations: 'Mantén el cuerpo en línea recta. Baja hasta que el pecho casi toque el suelo. Modifica apoyando las rodillas si es necesario.'
  ),
  Exercise(
    id: 'ex006',
    name: 'Fondos en Paralelas (Pecho)',
    description: 'Ejercicio con peso corporal que desarrolla la parte inferior del pecho.',
    type: 'Fuerza',
    muscleGroup: 'Pecho',
    equipment: 'Barras paralelas',
    measurement: 'reps',
    difficulty: 'Intermedio',
    recommendations: 'Inclina el torso hacia adelante para enfocar el pecho. Baja hasta que los hombros estén por debajo de los codos.'
  ),
  Exercise(
    id: 'ex007',
    name: 'Cruce de Poleas (Cable Crossover)',
    description: 'Proporciona tensión constante en los pectorales a través de todo el rango de movimiento.',
    type: 'Fuerza',
    muscleGroup: 'Pecho',
    equipment: 'Máquina de poleas',
    measurement: 'reps',
    difficulty: 'Intermedio',
    recommendations: 'Da un paso adelante para mayor estabilidad. Junta las manos al nivel del esternón, apretando el pecho.'
  ),
  Exercise(
    id: 'ex008',
    name: 'Press Declinado con Barra',
    description: 'Enfatiza la porción inferior (abdominal) de los pectorales.',
    type: 'Fuerza',
    muscleGroup: 'Pecho',
    equipment: 'Barra, banco declinado',
    measurement: 'reps',
    difficulty: 'Avanzado',
    recommendations: 'Ten cuidado al montar y desmontar el peso. Controla el movimiento en todo momento.'
  ),
  Exercise(
    id: 'ex009',
    name: 'Pullover con Mancuerna',
    description: 'Ejercicio único que estira la caja torácica y trabaja pecho y dorsales.',
    type: 'Fuerza',
    muscleGroup: 'Pecho',
    equipment: 'Mancuerna, banco plano',
    measurement: 'reps',
    difficulty: 'Intermedio',
    recommendations: 'Acuéstate transversalmente en el banco. Mantén los brazos semi-extendidos y baja la mancuerna por detrás de la cabeza.'
  ),
    Exercise(
    id: 'ex010',
    name: 'Flexiones con Agarre Ancho',
    description: 'Variación de las flexiones que pone un mayor énfasis en los músculos pectorales.',
    type: 'Fuerza',
    muscleGroup: 'Pecho',
    equipment: 'Peso corporal',
    measurement: 'reps',
    difficulty: 'Intermedio',
    recommendations: 'Coloca las manos más allá del ancho de los hombros. Mantén el core activado.'
  ),

  // Espalda (Back) - 10
  Exercise(
    id: 'ex011',
    name: 'Dominadas (Pull-ups)',
    description: 'Ejercicio clave para la amplitud de la espalda. Levanta tu cuerpo hasta que la barbilla supere la barra.',
    type: 'Fuerza',
    muscleGroup: 'Espalda',
    equipment: 'Barra de dominadas',
    measurement: 'reps',
    difficulty: 'Avanzado',
    recommendations: 'Usa un agarre prono (palmas hacia afuera). Inicia retrayendo las escápulas. Usa bandas de asistencia si es necesario.'
  ),
  Exercise(
    id: 'ex012',
    name: 'Peso Muerto Convencional',
    description: 'Ejercicio compuesto fundamental para la fuerza general de la espalda, piernas y core.',
    type: 'Fuerza',
    muscleGroup: 'Espalda',
    equipment: 'Barra',
    measurement: 'reps',
    difficulty: 'Avanzado',
    recommendations: 'Mantén la espalda neutra en todo momento. Empuja el suelo con las piernas para iniciar el levantamiento.'
  ),
  Exercise(
    id: 'ex013',
    name: 'Remo con Barra (Bent-Over Row)',
    description: 'Construye densidad y grosor en la espalda media y alta.',
    type: 'Fuerza',
    muscleGroup: 'Espalda',
    equipment: 'Barra',
    measurement: 'reps',
    difficulty: 'Intermedio',
    recommendations: 'Mantén el torso inclinado y la espalda recta. Lleva la barra hacia la parte baja del abdomen.'
  ),
  Exercise(
    id: 'ex014',
    name: 'Remo en Punta con Mancuerna',
    description: 'Trabajo unilateral para corregir desbalances y lograr una contracción profunda.',
    type: 'Fuerza',
    muscleGroup: 'Espalda',
    equipment: 'Mancuerna, banco plano',
    measurement: 'reps',
    difficulty: 'Principiante',
    recommendations: 'Apoya una rodilla y una mano en el banco. Mantén la espalda paralela al suelo. Rema llevando el codo hacia el techo.'
  ),
  Exercise(
    id: 'ex015',
    name: 'Jalón al Pecho (Lat Pulldown)',
    description: 'Alternativa al pull-up para desarrollar los músculos dorsales.',
    type: 'Fuerza',
    muscleGroup: 'Espalda',
    equipment: 'Máquina de jalón',
    measurement: 'reps',
    difficulty: 'Principiante',
    recommendations: 'Mantén el pecho erguido. Lleva la barra hasta la clavícula y aprieta la espalda.'
  ),
  Exercise(
    id: 'ex016',
    name: 'Remo Sentado en Polea (Seated Cable Row)',
    description: 'Ejercicio para grosor de espalda media.',
    type: 'Fuerza',
    muscleGroup: 'Espalda',
    equipment: 'Máquina de poleas',
    measurement: 'reps',
    difficulty: 'Principiante',
    recommendations: 'No uses el impulso de la espalda baja. Rema llevando los mangos hacia el abdomen.'
  ),
  Exercise(
    id: 'ex017',
    name: 'Face Pulls',
    description: 'Excelente para la salud de los hombros y para trabajar la espalda alta y deltoides posterior.',
    type: 'Fuerza',
    muscleGroup: 'Hombros',
    equipment: 'Máquina de poleas con cuerda',
    measurement: 'reps',
    difficulty: 'Principiante',
    recommendations: 'Jala la cuerda hacia tu cara, apuntando a separar las manos al final del movimiento. Mantén los codos altos.'
  ),
  Exercise(
    id: 'ex018',
    name: 'Peso Muerto Rumano',
    description: 'Enfocado en isquiotibiales y glúteos, pero también fortalece la espalda baja.',
    type: 'Fuerza',
    muscleGroup: 'Piernas',
    equipment: 'Barra, Mancuernas',
    measurement: 'reps',
    difficulty: 'Intermedio',
    recommendations: 'Mantén las piernas casi rectas (ligera flexión). Baja el peso deslizando por tus piernas hasta sentir un estiramiento profundo.'
  ),
  Exercise(
    id: 'ex019',
    name: 'Hiperextensiones',
    description: 'Fortalece la zona lumbar, glúteos e isquiotibiales.',
    type: 'Fuerza',
    muscleGroup: 'Espalda',
    equipment: 'Banco de hiperextensiones, peso corporal',
    measurement: 'reps',
    difficulty: 'Principiante',
    recommendations: 'Evita hiperextender la espalda en la parte superior. El movimiento debe ser controlado.'
  ),
  Exercise(
    id: 'ex020',
    name: 'Remo en T (T-Bar Row)',
    description: 'Variación de remo que permite levantar pesado con un agarre neutro.',
    type: 'Fuerza',
    muscleGroup: 'Espalda',
    equipment: 'Máquina de remo en T o barra',
    measurement: 'reps',
    difficulty: 'Intermedio',
    recommendations: 'Mantén la espalda recta. Usa el pecho como soporte si la máquina lo permite.'
  ),

  // Piernas (Legs) - 10
  Exercise(
    id: 'ex021',
    name: 'Sentadilla Trasera (Back Squat)',
    description: 'El ejercicio más completo para el tren inferior, trabajando cuádriceps, glúteos e isquiotibiales.',
    type: 'Fuerza',
    muscleGroup: 'Piernas',
    equipment: 'Barra, rack de sentadillas',
    measurement: 'reps',
    difficulty: 'Intermedio',
    recommendations: 'Mantén la espalda recta y el pecho erguido. Rompe la paralela (baja la cadera por debajo de las rodillas) si tu movilidad lo permite.'
  ),
  Exercise(
    id: 'ex022',
    name: 'Prensa de Piernas (Leg Press)',
    description: 'Permite mover mucho peso en un entorno seguro y controlado.',
    type: 'Fuerza',
    muscleGroup: 'Piernas',
    equipment: 'Máquina de prensa de piernas',
    measurement: 'reps',
    difficulty: 'Principiante',
    recommendations: 'No bloquees las rodillas al final. Un rango de movimiento completo es clave.'
  ),
  Exercise(
    id: 'ex023',
    name: 'Zancadas (Lunges)',
    description: 'Ejercicio unilateral que mejora el equilibrio, la coordinación y la fuerza de cada pierna.',
    type: 'Fuerza',
    muscleGroup: 'Piernas',
    equipment: 'Mancuernas, peso corporal',
    measurement: 'reps',
    difficulty: 'Principiante',
    recommendations: 'Da un paso largo y baja hasta que ambas rodillas formen un ángulo de 90 grados. Mantén el torso erguido.'
  ),
  Exercise(
    id: 'ex024',
    name: 'Sentadilla Búlgara',
    description: 'Variación de zancada con el pie trasero elevado para un mayor enfoque en el glúteo y cuádriceps.',
    type: 'Fuerza',
    muscleGroup: 'Piernas',
    equipment: 'Mancuernas, banco',
    measurement: 'reps',
    difficulty: 'Avanzado',
    recommendations: 'Controla el equilibrio. No dejes que la rodilla delantera sobrepase la punta del pie.'
  ),
  Exercise(
    id: 'ex025',
    name: 'Curl Femoral Acostado',
    description: 'Ejercicio de aislamiento específico para los isquiotibiales.',
    type: 'Fuerza',
    muscleGroup: 'Piernas',
    equipment: 'Máquina de curl femoral',
    measurement: 'reps',
    difficulty: 'Principiante',
    recommendations: 'Realiza el movimiento de forma lenta y controlada, apretando los isquios en la contracción.'
  ),
  Exercise(
    id: 'ex026',
    name: 'Extensión de Cuádriceps',
    description: 'Ejercicio de aislamiento para los cuádriceps.',
    type: 'Fuerza',
    muscleGroup: 'Piernas',
    equipment: 'Máquina de extensión de cuádriceps',
    measurement: 'reps',
    difficulty: 'Principiante',
    recommendations: 'No uses impulso. Sostén la contracción por un segundo en la parte alta.'
  ),
  Exercise(
    id: 'ex027',
    name: 'Elevación de Talones (Calf Raises)',
    description: 'Específico para desarrollar los músculos de las pantorrillas (gastrocnemio y sóleo).',
    type: 'Fuerza',
    muscleGroup: 'Piernas',
    equipment: 'Máquina, mancuernas, peso corporal',
    measurement: 'reps',
    difficulty: 'Principiante',
    recommendations: 'Busca un rango de movimiento completo, bajando el talón y elevándolo lo más alto posible.'
  ),
  Exercise(
    id: 'ex028',
    name: 'Sentadilla Frontal',
    description: 'Variación de la sentadilla que enfatiza los cuádriceps y requiere un core fuerte.',
    type: 'Fuerza',
    muscleGroup: 'Piernas',
    equipment: 'Barra',
    measurement: 'reps',
    difficulty: 'Avanzado',
    recommendations: 'Mantén los codos altos y el torso lo más vertical posible.'
  ),
  Exercise(
    id: 'ex029',
    name: 'Hip Thrust',
    description: 'El mejor ejercicio para aislar y construir los glúteos.',
    type: 'Fuerza',
    muscleGroup: 'Piernas',
    equipment: 'Barra, banco',
    measurement: 'reps',
    difficulty: 'Intermedio',
    recommendations: 'Empuja con la cadera hasta formar una línea recta con tu cuerpo. Aprieta los glúteos fuertemente en la cima.'
  ),
  Exercise(
    id: 'ex030',
    name: 'Sentadilla Goblet',
    description: 'Excelente para aprender el patrón de sentadilla y trabajar el core.',
    type: 'Fuerza',
    muscleGroup: 'Piernas',
    equipment: 'Mancuerna, kettlebell',
    measurement: 'reps',
    difficulty: 'Principiante',
    recommendations: 'Sostén el peso contra tu pecho. Mantén el torso erguido.'
  ),

  // Hombros (Shoulders) - 10
  Exercise(
    id: 'ex031',
    name: 'Press Militar con Barra (de pie)',
    description: 'Ejercicio fundamental para la fuerza y tamaño de los hombros.',
    type: 'Fuerza',
    muscleGroup: 'Hombros',
    equipment: 'Barra',
    measurement: 'reps',
    difficulty: 'Intermedio',
    recommendations: 'Mantén el core y los glúteos apretados para estabilidad. Pasa la cabeza "a través de la ventana" al subir.'
  ),
  Exercise(
    id: 'ex032',
    name: 'Press Arnold',
    description: 'Nombrado por Arnold Schwarzenegger, trabaja las tres cabezas del deltoides.',
    type: 'Fuerza',
    muscleGroup: 'Hombros',
    equipment: 'Mancuernas',
    measurement: 'reps',
    difficulty: 'Intermedio',
    recommendations: 'Inicia con las palmas hacia ti y rota las muñecas mientras subes el peso.'
  ),
  Exercise(
    id: 'ex033',
    name: 'Elevaciones Laterales con Mancuernas',
    description: 'El ejercicio clave para dar amplitud (anchura) a los hombros.',
    type: 'Fuerza',
    muscleGroup: 'Hombros',
    equipment: 'Mancuernas',
    measurement: 'reps',
    difficulty: 'Principiante',
    recommendations: 'No uses impulso. Levanta los brazos hacia los lados con una ligera flexión de codo, como si sirvieras dos jarras de agua.'
  ),
  Exercise(
    id: 'ex034',
    name: 'Elevaciones Frontales con Mancuerna',
    description: 'Aísla la cabeza anterior (frontal) del deltoides.',
    type: 'Fuerza',
    muscleGroup: 'Hombros',
    equipment: 'Mancuernas, disco',
    measurement: 'reps',
    difficulty: 'Principiante',
    recommendations: 'Levanta el peso hasta la altura de los hombros. Alterna los brazos o levanta ambos a la vez.'
  ),
  Exercise(
    id: 'ex035',
    name: 'Pájaros (Bent Over Dumbbell Raise)',
    description: 'Enfocado en el deltoides posterior, crucial para una espalda y hombros balanceados.',
    type: 'Fuerza',
    muscleGroup: 'Hombros',
    equipment: 'Mancuernas',
    measurement: 'reps',
    difficulty: 'Intermedio',
    recommendations: 'Inclina el torso, mantén la espalda recta. Levanta los brazos hacia los lados sin usar impulso.'
  ),
  Exercise(
    id: 'ex036',
    name: 'Remo al Mentón (Upright Row)',
    description: 'Ejercicio compuesto para hombros y trapecios.',
    type: 'Fuerza',
    muscleGroup: 'Hombros',
    equipment: 'Barra, mancuernas, polea',
    measurement: 'reps',
    difficulty: 'Intermedio',
    recommendations: 'Usa un agarre más ancho que los hombros para proteger la articulación. Levanta los codos hacia el techo.'
  ),
  Exercise(
    id: 'ex037',
    name: 'Encogimientos con Barra (Shrugs)',
    description: 'Ejercicio de aislamiento para los trapecios.',
    type: 'Fuerza',
    muscleGroup: 'Hombros',
    equipment: 'Barra, mancuernas',
    measurement: 'reps',
    difficulty: 'Principiante',
    recommendations: 'Encoge los hombros directamente hacia arriba. No rotes. Sostén la contracción.'
  ),
  Exercise(
    id: 'ex038',
    name: 'Press de Hombro Sentado con Mancuernas',
    description: 'Versión más estricta del press militar, ideal para enfocar solo los hombros.',
    type: 'Fuerza',
    muscleGroup: 'Hombros',
    equipment: 'Mancuernas, banco con respaldo',
    measurement: 'reps',
    difficulty: 'Principiante',
    recommendations: 'Mantén la espalda apoyada en el respaldo. Controla el movimiento en todo momento.'
  ),
  Exercise(
    id: 'ex039',
    name: 'Landmine Press',
    description: 'Ejercicio unilateral amigable con la articulación del hombro.',
    type: 'Fuerza',
    muscleGroup: 'Hombros',
    equipment: 'Barra, Landmine attachment',
    measurement: 'reps',
    difficulty: 'Intermedio',
    recommendations: 'Arrodíllate sobre una pierna y presiona la barra hacia arriba y adelante.'
  ),
  Exercise(
    id: 'ex040',
    name: 'Elevaciones Laterales en Polea',
    description: 'Proporciona tensión constante en el deltoides medio a diferencia de las mancuernas.',
    type: 'Fuerza',
    muscleGroup: 'Hombros',
    equipment: 'Máquina de poleas',
    measurement: 'reps',
    difficulty: 'Intermedio',
    recommendations: 'Párate de lado a la polea y levanta el brazo cruzando el cuerpo.'
  ),

  // Brazos (Arms) - 10 (5 Bíceps, 5 Tríceps)
  Exercise(
    id: 'ex041',
    name: 'Curl de Bíceps con Barra',
    description: 'Constructor de masa fundamental para los bíceps.',
    type: 'Fuerza',
    muscleGroup: 'Brazos',
    equipment: 'Barra recta o Z',
    measurement: 'reps',
    difficulty: 'Principiante',
    recommendations: 'No balancees el cuerpo. Mantén los codos pegados a los costados.'
  ),
  Exercise(
    id: 'ex042',
    name: 'Curl de Bíceps con Mancuernas (alterno)',
    description: 'Permite la supinación de la muñeca para una máxima contracción del bíceps.',
    type: 'Fuerza',
    muscleGroup: 'Brazos',
    equipment: 'Mancuernas',
    measurement: 'reps',
    difficulty: 'Principiante',
    recommendations: 'Gira la palma hacia arriba mientras subes la mancuerna. Controla el descenso.'
  ),
  Exercise(
    id: 'ex043',
    name: 'Curl Martillo (Hammer Curl)',
    description: 'Trabaja el bíceps y el músculo braquial, añadiendo grosor al brazo.',
    type: 'Fuerza',
    muscleGroup: 'Brazos',
    equipment: 'Mancuernas',
    measurement: 'reps',
    difficulty: 'Principiante',
    recommendations: 'Mantén las palmas enfrentadas (agarre neutro) durante todo el movimiento.'
  ),
  Exercise(
    id: 'ex044',
    name: 'Curl Predicador (Preacher Curl)',
    description: 'Aísla el bíceps de manera estricta, evitando el impulso.',
    type: 'Fuerza',
    muscleGroup: 'Brazos',
    equipment: 'Banco predicador, barra Z, mancuerna',
    measurement: 'reps',
    difficulty: 'Intermedio',
    recommendations: 'No extiendas completamente el codo en la parte baja para mantener la tensión.'
  ),
    Exercise(
    id: 'ex045',
    name: 'Curl de Concentración',
    description: 'Ejercicio de aislamiento para el "pico" del bíceps.',
    type: 'Fuerza',
    muscleGroup: 'Brazos',
    equipment: 'Mancuerna, banco',
    measurement: 'reps',
    difficulty: 'Intermedio',
    recommendations: 'Siéntate y apoya el codo en la parte interna del muslo. Concéntrate en la contracción.'
  ),
  Exercise(
    id: 'ex046',
    name: 'Press Francés (Skullcrushers)',
    description: 'Ejercicio clave para la masa de los tríceps.',
    type: 'Fuerza',
    muscleGroup: 'Brazos',
    equipment: 'Barra Z, mancuernas, banco plano',
    measurement: 'reps',
    difficulty: 'Intermedio',
    recommendations: 'Baja el peso hacia la frente manteniendo los codos apuntando al techo. No dejes que los codos se abran.'
  ),
  Exercise(
    id: 'ex047',
    name: 'Extensiones de Tríceps en Polea (Pushdown)',
    description: 'Excelente para aislar los tríceps con tensión constante.',
    type: 'Fuerza',
    muscleGroup: 'Brazos',
    equipment: 'Máquina de poleas, barra recta o cuerda',
    measurement: 'reps',
    difficulty: 'Principiante',
    recommendations: 'Mantén los codos pegados al cuerpo. Extiende completamente los brazos y aprieta los tríceps.'
  ),
  Exercise(
    id: 'ex048',
    name: 'Fondos de Tríceps entre Bancos',
    description: 'Ejercicio con peso corporal muy efectivo. Puedes añadir peso sobre tus piernas.',
    type: 'Fuerza',
    muscleGroup: 'Brazos',
    equipment: 'Dos bancos planos',
    measurement: 'reps',
    difficulty: 'Intermedio',
    recommendations: 'Mantén la espalda cerca del banco. Baja hasta que los codos formen un ángulo de 90 grados.'
  ),
  Exercise(
    id: 'ex049',
    name: 'Extensión de Tríceps sobre la Cabeza',
    description: 'Estira y trabaja la cabeza larga del tríceps.',
    type: 'Fuerza',
    muscleGroup: 'Brazos',
    equipment: 'Mancuerna, polea',
    measurement: 'reps',
    difficulty: 'Intermedio',
    recommendations: 'Puedes hacerlo sentado o de pie. Mantén los codos apuntando hacia arriba.'
  ),
  Exercise(
    id: 'ex050',
    name: 'Flexiones Diamante (Diamond Push-ups)',
    description: 'Variación de flexión que pone un gran énfasis en los tríceps.',
    type: 'Fuerza',
    muscleGroup: 'Brazos',
    equipment: 'Peso corporal',
    measurement: 'reps',
    difficulty: 'Avanzado',
    recommendations: 'Forma un diamante con tus manos debajo del pecho. Mantén los codos pegados al cuerpo al bajar.'
  ),

  // Abdomen (Core) & Cardio - 10
  Exercise(
    id: 'ex051',
    name: 'Plancha Abdominal (Plank)',
    description: 'Ejercicio isométrico fundamental para la fuerza y estabilidad del core.',
    type: 'Resistencia',
    muscleGroup: 'Abdomen',
    equipment: 'Peso corporal',
    measurement: 'time',
    difficulty: 'Principiante',
    recommendations: 'Mantén el cuerpo en una línea recta de la cabeza a los talones. Aprieta abdomen y glúteos.'
  ),
  Exercise(
    id: 'ex052',
    name: 'Crunches (Encogimientos Abdominales)',
    description: 'Ejercicio básico para el recto abdominal.',
    type: 'Fuerza',
    muscleGroup: 'Abdomen',
    equipment: 'Peso corporal',
    measurement: 'reps',
    difficulty: 'Principiante',
    recommendations: 'Levanta solo la cabeza y hombros del suelo. No tires del cuello con las manos.'
  ),
  Exercise(
    id: 'ex053',
    name: 'Elevación de Piernas Colgado',
    description: 'Ejercicio avanzado para la parte inferior del abdomen y flexores de cadera.',
    type: 'Fuerza',
    muscleGroup: 'Abdomen',
    equipment: 'Barra de dominadas',
    measurement: 'reps',
    difficulty: 'Avanzado',
    recommendations: 'Evita balancearte. Levanta las piernas lo más alto que puedas de forma controlada.'
  ),
  Exercise(
    id: 'ex054',
    name: 'Rueda Abdominal (Ab Wheel Rollout)',
    description: 'Ejercicio muy desafiante para todo el core.',
    type: 'Fuerza',
    muscleGroup: 'Abdomen',
    equipment: 'Rueda abdominal',
    measurement: 'reps',
    difficulty: 'Avanzado',
    recommendations: 'Empieza con un rango de movimiento corto. Mantén la espalda recta, no dejes que se arquee.'
  ),
  Exercise(
    id: 'ex055',
    name: 'Giros Rusos (Russian Twists)',
    description: 'Ejercicio para trabajar los oblicuos.',
    type: 'Fuerza',
    muscleGroup: 'Abdomen',
    equipment: 'Balón medicinal, disco, mancuerna',
    measurement: 'reps',
    difficulty: 'Intermedio',
    recommendations: 'Mantén los pies en el aire para mayor dificultad. Gira el torso, no solo los brazos.'
  ),
  Exercise(
    id: 'ex056',
    name: 'Correr (Running)',
    description: 'Ejercicio cardiovascular fundamental para la salud y la quema de calorías.',
    type: 'Cardio',
    muscleGroup: 'Cuerpo Completo',
    equipment: 'Ninguno, cinta de correr',
    measurement: 'distance',
    difficulty: 'Todos',
    recommendations: 'Mantén una buena postura. Aumenta la intensidad o distancia progresivamente.'
  ),
  Exercise(
    id: 'ex057',
    name: 'Saltar la Cuerda (Jump Rope)',
    description: 'Excelente para la coordinación, agilidad y un cardio de alta intensidad.',
    type: 'Cardio',
    muscleGroup: 'Cuerpo Completo',
    equipment: 'Cuerda para saltar',
    measurement: 'time',
    difficulty: 'Todos',
    recommendations: 'Mantén los saltos bajos y gira la cuerda con las muñecas, no con los hombros.'
  ),
  Exercise(
    id: 'ex058',
    name: 'Burpees',
    description: 'Ejercicio de cuerpo completo de alta intensidad que combina flexión, sentadilla y salto.',
    type: 'Cardio',
    muscleGroup: 'Cuerpo Completo',
    equipment: 'Peso corporal',
    measurement: 'reps',
    difficulty: 'Intermedio',
    recommendations: 'Mantén un ritmo constante y el core activado.'
  ),
  Exercise(
    id: 'ex059',
    name: 'Escaladores de Montaña (Mountain Climbers)',
    description: 'Ejercicio de cardio que también fortalece el core, simulando escalar.',
    type: 'Cardio',
    muscleGroup: 'Abdomen',
    equipment: 'Peso corporal',
    measurement: 'time',
    difficulty: 'Principiante',
    recommendations: 'Mantén las manos debajo de los hombros y lleva las rodillas hacia el pecho de forma alterna.'
  ),
  Exercise(
    id: 'ex060',
    name: 'Bicicleta Estática',
    description: 'Cardio de bajo impacto ideal para calentamientos, enfriamientos o sesiones largas.',
    type: 'Cardio',
    muscleGroup: 'Piernas',
    equipment: 'Bicicleta estática',
    measurement: 'time',
    difficulty: 'Todos',
    recommendations: 'Ajusta la resistencia según tu nivel. Mantén una cadencia constante.'
  )
];
