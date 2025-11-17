
import '../models/exercise.dart';

List<Exercise> initialExercises = [
  Exercise(
    id: 'ex001',
    name: 'Press de Banca',
    description: 'Ejercicio de levantamiento de pesas para la parte superior del cuerpo que consiste en presionar un peso hacia arriba desde una posición acostada.',
    type: 'Fuerza',
    muscleGroup: 'Pecho',
    equipment: 'Barra, banco',
    measurement: 'reps',
    difficulty: 'Intermedio',
    recommendations: 'Mantén la espalda arqueada y los pies firmes en el suelo para mayor estabilidad. Controla el peso en la fase de descenso.'
  ),
  Exercise(
    id: 'ex002',
    name: 'Sentadillas',
    description: 'Ejercicio de fuerza en el que el levantador se pone en cuclillas y luego se levanta.',
    type: 'Fuerza',
    muscleGroup: 'Piernas',
    equipment: 'Barra',
    measurement: 'reps',
    difficulty: 'Intermedio',
    recommendations: 'Mantén la espalda recta y el pecho erguido. Baja hasta que los muslos estén paralelos al suelo.'
  ),
  Exercise(
    id: 'ex003',
    name: 'Peso Muerto',
    description: 'Ejercicio con pesas en el que se levanta una barra cargada desde el suelo hasta la altura de las caderas, y luego se baja al suelo.',
    type: 'Fuerza',
    muscleGroup: 'Espalda, Piernas',
    equipment: 'Barra',
    measurement: 'reps',
    difficulty: 'Avanzado',
    recommendations: 'Mantén la espalda recta durante todo el levantamiento. Inicia el movimiento con las piernas y la cadera, no con la espalda.'
  ),
  Exercise(
    id: 'ex004',
    name: 'Press Militar',
    description: 'Ejercicio de levantamiento de pesas que consiste en presionar un peso por encima de la cabeza.',
    type: 'Fuerza',
    muscleGroup: 'Hombros',
    equipment: 'Barra, Mancuernas',
    measurement: 'reps',
    difficulty: 'Intermedio',
    recommendations: 'Mantén el core apretado para proteger la espalda baja. No uses las piernas para impulsar el peso.'
  ),
  Exercise(
    id: 'ex005',
    name: 'Remo con Barra',
    description: 'Ejercicio de entrenamiento con pesas que se dirige a la espalda.',
    type: 'Fuerza',
    muscleGroup: 'Espalda',
    equipment: 'Barra',
    measurement: 'reps',
    difficulty: 'Intermedio',
    recommendations: 'Inclina el torso hacia adelante, manteniendo la espalda recta. Lleva la barra hacia el abdomen.'
  ),
  Exercise(
    id: 'ex006',
    name: 'Curl de Bíceps',
    description: 'Ejercicio de fuerza común para los brazos.',
    type: 'Fuerza',
    muscleGroup: 'Brazos',
    equipment: 'Mancuernas, Barra',
    measurement: 'reps',
    difficulty: 'Principiante',
    recommendations: 'Evita balancear el cuerpo. Mantén los codos pegados a los costados y concéntrate en contraer los bíceps.'
  ),
  Exercise(
    id: 'ex007',
    name: 'Extensiones de Tríceps',
    description: 'Ejercicio para aislar los tríceps.',
    type: 'Fuerza',
    muscleGroup: 'Brazos',
    equipment: 'Mancuernas, Polea',
    measurement: 'reps',
    difficulty: 'Principiante',
    recommendations: 'Mantén los codos fijos en una posición. El movimiento debe provenir únicamente de la articulación del codo.'
  ),
  Exercise(
    id: 'ex008',
    name: 'Elevaciones Laterales',
    description: 'Ejercicio para fortalecer los deltoides.',
    type: 'Fuerza',
    muscleGroup: 'Hombros',
    equipment: 'Mancuernas',
    measurement: 'reps',
    difficulty: 'Principiante',
    recommendations: 'Levanta las mancuernas hacia los lados con una ligera flexión en los codos. No uses impulso.'
  ),
  Exercise(
    id: 'ex009',
    name: 'Zancadas',
    description: 'Ejercicio de una sola pierna que trabaja los cuádriceps, glúteos e isquiotibiales.',
    type: 'Fuerza',
    muscleGroup: 'Piernas',
    equipment: 'Peso corporal, Mancuernas',
    measurement: 'reps',
    difficulty: 'Principiante',
    recommendations: 'Da un paso adelante y baja la cadera hasta que ambas rodillas estén dobladas en un ángulo de 90 grados. Mantén el torso erguido.'
  ),
  Exercise(
    id: 'ex010',
    name: 'Plancha',
    description: 'Ejercicio isométrico de fuerza para el core que consiste en mantener una posición similar a la de una flexión durante el mayor tiempo posible.',
    type: 'Resistencia',
    muscleGroup: 'Abdomen',
    equipment: 'Peso corporal',
    measurement: 'time',
    difficulty: 'Principiante',
    recommendations: 'Mantén el cuerpo en línea recta desde la cabeza hasta los talones. Aprieta los glúteos y el abdomen.'
  ),
  Exercise(
    id: 'ex011',
    name: 'Flexiones',
    description: 'Ejercicio de calistenia que se realiza en posición prona, levantando y bajando el cuerpo con los brazos.',
    type: 'Fuerza',
    muscleGroup: 'Pecho, Hombros, Brazos',
    equipment: 'Peso corporal',
    measurement: 'reps',
    difficulty: 'Principiante',
    recommendations: 'Mantén el cuerpo recto. Baja hasta que el pecho casi toque el suelo. Si es muy difícil, apoya las rodillas en el suelo.'
  ),
  Exercise(
    id: 'ex012',
    name: 'Dominadas',
    description: 'Ejercicio de la parte superior del cuerpo en el que se levanta el cuerpo por encima de una barra fija.',
    type: 'Fuerza',
    muscleGroup: 'Espalda, Brazos',
    equipment: 'Barra de dominadas',
    measurement: 'reps',
    difficulty: 'Avanzado',
    recommendations: 'Inicia el movimiento retrayendo las escápulas. Intenta llevar el pecho a la barra. Si no puedes hacer una, usa una banda de resistencia.'
  ),
  Exercise(
    id: 'ex013',
    name: 'Fondos en Paralelas',
    description: 'Ejercicio de fuerza para la parte superior del cuerpo.',
    type: 'Fuerza',
    muscleGroup: 'Pecho, Hombros, Brazos',
    equipment: 'Barras paralelas',
    measurement: 'reps',
    difficulty: 'Intermedio',
    recommendations: 'Baja hasta que los hombros estén ligeramente por debajo de los codos. Inclina el torso hacia adelante para enfocar más el pecho.'
  ),
  Exercise(
    id: 'ex014',
    name: 'Prensa de Piernas',
    description: 'Ejercicio de levantamiento de pesas en el que el individuo empuja un peso o resistencia lejos de ellos usando sus piernas.',
    type: 'Fuerza',
    muscleGroup: 'Piernas',
    equipment: 'Máquina de prensa de piernas',
    measurement: 'reps',
    difficulty: 'Principiante',
    recommendations: 'No bloquees las rodillas al final del movimiento. Mantén los pies planos sobre la plataforma.'
  ),
  Exercise(
    id: 'ex015',
    name: 'Correr',
    description: 'Actividad cardiovascular.',
    type: 'Cardio',
    muscleGroup: 'Piernas',
    equipment: 'Ninguno',
    measurement: 'time',
    difficulty: 'Todos',
    recommendations: 'Mantén una postura erguida. Aterriza con la parte media del pie en lugar del talón. Aumenta la distancia o la velocidad gradualmente.'
  )
];
