import { readFileSync, writeFileSync } from "fs";

const args = process.argv;
const podcastsName: string[] = args.slice(2);

const resFileContent: string[] = [];

function getDownloadsForPodcast(podcast: string) {
  const jsonDownloads = JSON.parse(
    readFileSync(`data/${podcast}/downloads.json`).toString()
  );

  let lifeTimeListen: number = 0;
  let yearListens: number = 0;

  let currentYearIndex = jsonDownloads.downloads.monthly.length - 12;

  jsonDownloads.downloads.monthly.forEach(
    (month: { x: number; y: number }, index: number) => {
      lifeTimeListen = lifeTimeListen + month.y;

      if (index + 1 > currentYearIndex) {
        yearListens = yearListens + month.y;
      }
    }
  );

  resFileContent.push(`## ${podcast}`);
  resFileContent.push(
    `${lifeTimeListen} écoutes depuis la création du podcast`
  );
  resFileContent.push(`> ${yearListens} écoutes dans les 12 derniers mois`);
}

// file generation
resFileContent.push(`# Statistiques`);

podcastsName.forEach((podcastsName) => {
  getDownloadsForPodcast(podcastsName);
});

let flatResContent: string = resFileContent.join("\n");

console.log(flatResContent);
writeFileSync("statistics.md", flatResContent);
