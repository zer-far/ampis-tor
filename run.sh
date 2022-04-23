rm -rf ampis.org
wget -mpEk ampis.org &> /dev/null
function startTor(){
  if ![ -d "./tor" ]
  then
    mkdir ./tor 2> /dev/null
  fi
  tor -f ./.torrc
}
function server(){
  if ![ -d "./package.json" ]
  then
    npm install
  fi
  npm start
}
function run(){
  server & 
  startTor
}
cat ./tor/hidden_service/hostname
run &> /dev/null
