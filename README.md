# podcloud-stats-extractor

This projects get data from multiple podcasts and provides a small markdown file with the statistics.

## How ?

Create a `config.sh` file with the following variables :

```bash
CSRF_TOKEN="<fill with data>"
COOKIE="<fill with data>"
PODCASTS=("nameOfTheFirstPodcast" "nameOfTheSecondPodcast")

```

Fill the CSRF_TOKEN and COOKIE part with a valid value you can find in your browser's dev tool. :smirk:

The format of the name is the one in the URL of your Podcloud studio dashboard.

Run the bash file that grabs the data from Podcloud.

```bash
./updateData.sh
```

And then run the analyser by doing.

```bash
npm run build
npm run start nameOfTheFirstPodcast nameOfTheSecondPodcast
```

## Why ?

I needed to get the data and I didn't wanted to count myself by hand.

I just wanted to code things.

## Hey it does not work man wtf

This is offered as-is for my own benefit, I will not fix this if I don't need to fix it myself.
