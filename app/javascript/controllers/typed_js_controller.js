import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

export default class extends Controller {
  connect() {

    const info = ["La première cause de déforestation dans le monde est la production animale.",
    "L'élevage bovin est reponsable de 63% de la déforestation de la forêt Amazonienne.",
    "On estime à environ 5m3 d’eau pour la production de 1 000 calories animales quand il en faut seulement 1m3 pour 1 000 calories végétales.",
    "Antibiotiques, produits chimiques, engrais, hormones, et pesticides issus de l'élevage sont retrouvés dans les eaux et les sols.",
    "Les vaches sont des êtres sensibles, qui communiquent avec des vocalisations et leurs corps, et ont une vie sociale riche.",
    "Les poissons et autres produits de la mer contiennent du cadmium, du mercure, de l’arsenic et du chrome. Certains de ces métaux ont des conséquences délétères pour la santé : cancérogènes, neurotoxiques, entraînant des effets osseux, rénaux, cardiovasculaires…",
    "Les poissons et crustacés sont dotés de nocicepteurs : ils ressentent donc aussi la douleur...",
    "En France, 95 % des cochons sont élevés de manière intensive, sans accès à l’extérieur et le plus souvent isolés (truies reproductrices), ou confinés en grand nombre dans de petits espaces (cochons élevés pour leur chair).",
    "En France, la grande majorité des poulets sont enfermés toute leur vie en bâtiment, sans accès à l’extérieur. Les densités atteignent 22 oiseaux par mètre carré dans les élevages standards, soit moins d’une feuille A4 d’espace par poulet...",
    "Les moutons sont très intelligents. Bien plus intelligents que ce qu’on a pu penser. Sur des tâches comparables, leurs performances sont équivalentes à celles d’un singe." ];
    const sample = Math.floor(Math.random() * info.length);
    console.log(sample)
    new Typed(this.element, {
      strings:  info,
      typeSpeed: 20,
      loop: true,
      shuffle: true,
      backDelay: 10000,
      // backSpeed:20
    })
  }
}
