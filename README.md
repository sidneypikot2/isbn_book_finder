## Run in Local

1. install docker
  `https://docs.docker.com/engine/install/`
2. install docker compose
  `https://docs.docker.com/compose/install/`
3. docker compose build
4. docker compose run web rake db:create
5. docker compose run web rake db:migrate
6. docker compose run web rake db:seed
7. visit `localhost:3000` to go to the app
8. for json response - visit `localhost:3000/books/search.json?isbn=isbn_10_or_13`

## Valid ISBN for existing books

|      ISBN 13       |       ISBN 10     |
| ------------------ | ----------------- |
| 978-1-891830-85-3  |  1-891-83085-6    |
| 978-1-60309-454-2  |  1-603-09454-7    |
| 978-1-60309-038-4  |  1-603-09038-X    |
| 978-1-891830-02-0  |  1-891-83002-3    |
| 978-1-60309-398-9  |  1-603-09398-2    |
| 978-1-60309-509-9  |  1-603-09509-8    |
| 978-1-60309-513-6  |  1-603-09513-6    |

## Valid ISBN for not existing books

|      ISBN 13       |       ISBN 10     |
| ------------------ | ----------------- |
| 978-1-60309-015-5  |   1-60309-015-0   |
| 978-0-439-42089-1  |   0-439-42089-X   |
| 978-1-60309-368-2  |   1-60309-368-0   |
