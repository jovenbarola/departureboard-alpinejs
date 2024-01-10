import express from 'express';
import {createClient} from '@supabase/supabase-js'
import morgan from 'morgan'
import bodyParser from "body-parser";

const app = express()
const port = 3000

// console.log(process.env.SUPABASE_PROJECT_URL)
// console.log(process.env.SUPABASE_API_KEY)

const supabase = createClient(process.env.SUPABASE_PROJECT_URL, process.env.SUPABASE_API_KEY)


// using morgan for logs
app.use(morgan('combined'));

app.use(bodyParser.urlencoded({extended: true}));
app.use(bodyParser.json());

app.use(express.static('public'))
app.use('/admin', express.static('admin'))

app.get('/hello', (req, res) => {
  res.send('Hello World!')
})

app.get('/flights', async (req, res) => {
  const {data, error} = await supabase
      .from('flights')
      .select()

      // console.log(data)
  res.send(data);
});

app.get('/flights/:id', async (req, res) => {
  const {data, error} = await supabase
      .from('flights')
      .select()
      .eq('flightno', req.params.id)
  res.send(data);
});

app.post('/flights', async (req, res) => {
  const {error} = await supabase
      .from('flights')
      .insert({
          flightno: req.body.flightno,
          destination: req.body.destination,
          gate: req.body.gate,
          departtime: req.body.departtime,
          remarks: req.body.remarks,
      })
  if (error) {
      res.send(error);
  }
  res.send("created!!");
});

app.put('/flights/:id', async (req, res) => {
  const {error} = await supabase
      .from('flights')
      .update({
          flightno: req.body.flightno,
          destination: req.body.destination,
          gate: req.body.gate,
          departtime: req.body.departtime,
          remarks: req.body.remarks,
      })
      .eq('id', req.params.id)
  if (error) {
      res.send(error);
  }
  res.send("updated!!");
});

// change status
app.post('/changestatus', async (req, res) => {
  const {error} = await supabase
      .from('flights')
      .update({
          remarks: req.body.status,
      })
      .eq('id', req.body.id)
  if (error) {
      res.send(error);
  }
  res.send({ status: "updated" });
});

app.delete('/flights/:id', async (req, res) => {
  const {error} = await supabase
      .from('flights')
      .delete()
      .eq('id', req.params.id)
  if (error) {
      res.send(error);
  }
  res.send("deleted!!")

});

app.get('/v1/apitest', (req, res) => {
  let arr = [
      {
          flightno: "1001",
          destination: "Japan",
          gate: "3",
          departtime: "10:00",
          remarks: "IN"
      },
      {
          flightno: "1002",
          destination: "Singapore",
          gate: "T2",
          departtime: "10:00",
          remarks: "IN"
      },
  ]
  res.send(arr)
})

app.listen(port, () => {
  console.log(`App listening on port ${port}`)
})