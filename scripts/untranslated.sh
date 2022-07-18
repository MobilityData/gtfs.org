
# remove, and duplicate all untranslated into every language extension

lang=(
    id
    de
    es
    fr
    pt_BR
    ru
    zh
    ja
    ko
)

note=(
    "Terjemahan untuk halaman ini ke dalam bahasa Indonesia belum tersedia."
    "Für diese Seite sind noch keine Übersetzungen ins Deutsche verfügbar."
    "La traducción de esta página al español aún no está disponible."
    "Les traductions de cette page en français ne sont pas encore disponibles."
    "As traduções para esta página em português ainda não estão disponíveis."
    "Переводы этой страницы на русский язык пока недоступны."
    "本页尚未有中文翻译。"
    "このページの日本語訳はまだありません。"
    "이 페이지에 대한 한국어 번역은 아직 제공되지 않습니다."
)

# echo front matter to hide page from search
---
search:
  exclude: true
---


# echo note

!!! Warning ""

    [string]


for file in docs/resources/*
for l n in lang 
do
  basename=`basename "$file" .md`
  echo > docs/resources/$basename.$l.md
done