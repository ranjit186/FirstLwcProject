({
    getWords : function(count) {
        if( count > 100) return;


        let wordArray = [
            "word1",
            "word2",
            "word3",
            "word4",
            "word5",
            "word6",
            "word7",
            "word8",
            "word9",
            "word10",
            "word11",
            "word12",
            "word13",
            "word14",
            "word15",
            "word16",
            "word17",
            "word18",
            "word19",
            "word20",
            "word21",
            "word22",
            "word23",
            "word24",
            "word25",
            "word26",
            "word27",
            "word28",
            "word29",
            "word30",
            "word31",
            "word32",
            "word33",
            "word34",
            "word35",
            "word36",
            "word37",
            "word38",
            "word39",
            "word40",
            "word41",
            "word42",
            "word43",
            "word44",
            "word45",
            "word46",
            "word47",
            "word48",
            "word49",
            "word50",

            "word51",
            "word52",
            "word53",
            "word54",
            "word55",
            "word56",
            "word57",
            "word58",
            "word59",
            "word60",
            "word61",
            "word62",
            "word63",
            "word64",
            "word65",
            "word66",
            "word67",
            "word68",
            "word69",
            "word70",
            "word71",
            "word72",
            "word73",
            "word74",
            "word75",
            "word76",
            "word77",
            "word78",
            "word79",
            "word80",
            "word81",
            "word82",
            "word83",
            "word84",
            "word85",
            "word86",
            "word87",
            "word88",
            "word89",
            "word90",
            "word91",
            "word92",
            "word493",
            "word94",
            "word95",
            "word96",
            "word97",
            "word98",
            "word99",
            "word100",
            ];

                //  random words
                wordArray = this.randomizeArray(wordArray);
                const wordObjArray = wordArray.map(element =>{
                    return {word: element, open: false};
                })
            // return requseted count
         return  wordObjArray.slice(0, count);
    },
    randomizeArray : function(arr){
        const randomArr = arr;
        for( let i = randomArr.length - 1;i > 0 ; i-- ){
            const j = Math.floor(Math.random() * i);
            const temp = randomArr[i];
            randomArr[i] = randomArr[j];
            randomArr[j] = temp;

        }
        return randomArr;
    },
    getWinWord : function(arr){
        const randomIndex = Math.floor(Math.random() * arr.length);
        return arr[randomIndex].word;
    },
    disableBoard : function(component){
        component.set("v.boardDisabled", true);

    },
    enableBoard : function(component){
        component.set("v.boardDisabled", false);
    },
    resetBoard : function(component){
        this.enableBoard(component);
        component.set("v.result", "");
        component.set("v.clickCount", 0);

    },

    fireResultEvent : function(resultValue){
        const appevent = $A.get("e.c:ResultApplicationEvent");
        appevent.setParams({result : resultValue});
        appevent.fire();
    }
})