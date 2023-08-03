//variables
let cardBeignDragged;
let dropzones = document.querySelectorAll('.dropzone');
let priorities;
// let cards = document.querySelectorAll('.kanbanCard');
let dataColors = [
    {color:"yellow", title:"To do"},
    {color:"green", title:"In progress"},
    {color:"blue", title:"Done"},
];
let dataCards = {
    config:{
        maxid:0
    },
    cards:[]
};
let theme="light";
//initialize

/*$(document).ready(()=>{
    $("#loadingScreen").addClass("d-none");
    theme = localStorage.getItem('@kanban:theme');
    if(theme){
        $("body").addClass(`${theme==="light"?"":"darkmode"}`);
    }
    initializeBoards();
    if(JSON.parse(localStorage.getItem('@kanban:data'))){
        dataCards = JSON.parse(localStorage.getItem('@kanban:data'));
        initializeComponents(dataCards);
    }
    initializeCards();
    $('#add').click(()=>{
        const title = $('#titleInput').val()!==''?$('#titleInput').val():null;
        const description = $('#descriptionInput').val()!==''?$('#descriptionInput').val():null;
        const start = $('#startInput').val()!==''?$('#startInput').val():null;
        const end = $('#endInput').val()!==''?$('#endInput').val():null;
        $('#titleInput').val('');
        $('#descriptionInput').val('');
        $('#startInput').val('');
        $('#endInput').val('');
        if(title && description && start && end){
            let id = dataCards.config.maxid+1;
            const newCard = {
                id,
                title,
                description,
                start,
                end,
                position:"yellow",
                priority: false
            }
            dataCards.cards.push(newCard);
            dataCards.config.maxid = id;
            save();
            appendComponents(newCard);
            initializeCards();
        }
    });
    $("#deleteAll").click(()=>{
        dataCards.cards = [];
        save();
    });
    $("#theme-btn").click((e)=>{
        e.preventDefault();
        $("body").toggleClass("darkmode");
        if(theme){
            localStorage.setItem("@kanban:theme", `${theme==="light"?"darkmode":""}`)
        }
        else{
            localStorage.setItem("@kanban:theme", "darkmode")
        }
    });
});*/

//functions
function initializeBoards(){    
    dataColors.forEach(item=>{
        let htmlString = `
        <div class="board">
            <h3 class="text-center">${item.title.toUpperCase()}</h3>
            <div class="dropzone" id="${item.color}">
                
            </div>
        </div>
        `
        $("#boardsContainer").append(htmlString)
    });
    let dropzones = document.querySelectorAll('.dropzone');
    dropzones.forEach(dropzone=>{
        dropzone.addEventListener('dragenter', dragenter);
        dropzone.addEventListener('dragover', dragover);
        dropzone.addEventListener('dragleave', dragleave);
        dropzone.addEventListener('drop', drop);
    });
}

function initializeCards(){
    cards = document.querySelectorAll('.kanbanCard');
    
    cards.forEach(card=>{
        card.addEventListener('dragstart', dragstart);
        card.addEventListener('drag', drag);
        card.addEventListener('dragend', dragend);
    });
}

function initializeComponents(dataArray){
    //create all the stored cards and put inside of the todo area
    dataArray.cards.forEach(card=>{
        appendComponents(card); 
    })
}

function appendComponents(card){
    //creates new card inside of the todo area
    let htmlString = `
        <div id=${card.id.toString()} class="kanbanCard ${card.position}" draggable="true">
            <div class="content">               
            <p class="title">${card.company}</p>
        <a href="BoardList.do?projectName=${card.description}" style="text-decoration:none;">
               <h4 class="description">${card.description}</h4>
            </a>
                <p class="start_end">기간 : ${card.start} ~ ${card.end}</p>
            </div>
            <form class="row mx-auto justify-content-between">
                <span id="span-${card.id.toString()}" onclick="togglePriority(event)" class="material-icons priority ${card.priority? "is-priority": ""}">
                    star
                </span>
                <button class="invisibleBtn">
                    <span class="material-icons delete" onclick="deleteCard(${card.id.toString()})">
                        remove_circle
                    </span>
                </button>
            </form>
        </div>  
    `
    $(`#${card.position}`).append(htmlString);
    priorities = document.querySelectorAll(".priority");
}

function togglePriority(event){
    event.target.classList.toggle("is-priority");
    dataCards.cards.forEach(card=>{
        if(event.target.id.split('-')[1] === card.id.toString()){
            card.priority=card.priority?false:true;
        }
    })
    save();
}

/*function deleteCard(id){
    dataCards.cards.forEach(card=>{
        if(card.id === id){
            let index = dataCards.cards.indexOf(card);
            console.log(index)
            dataCards.cards.splice(index, 1);
            console.log(dataCards.cards);
            save();
        }
    })
}*/

/*function deleteCard(id) {
  dataCards.cards.forEach((card, index) => {
    if (card.id === id) {
      dataCards.cards.splice(index, 1);
      save();
    }
  });
}
*/

function removeClasses(cardBeignDragged, color){
    cardBeignDragged.classList.remove('red');
    cardBeignDragged.classList.remove('blue');
    cardBeignDragged.classList.remove('purple');
    cardBeignDragged.classList.remove('green');
    cardBeignDragged.classList.remove('yellow');
    cardBeignDragged.classList.add(color);
    position(cardBeignDragged, color);
}



function position(cardBeignDragged, color){
    const index = dataCards.cards.findIndex(card => card.id === parseInt(cardBeignDragged.id));
    dataCards.cards[index].position = color;
    save();
}

//cards
function dragstart(){
    dropzones.forEach( dropzone=>dropzone.classList.add('highlight'));
    this.classList.add('is-dragging');
}

function drag(){
    
}

function dragend(){
    dropzones.forEach( dropzone=>dropzone.classList.remove('highlight'));
    this.classList.remove('is-dragging');
}

// Release cards area
function dragenter(){

}

function dragover({target}){
    this.classList.add('over');
    cardBeignDragged = document.querySelector('.is-dragging');
    if(this.id ==="yellow"){
        removeClasses(cardBeignDragged, "yellow");
        
    }
    else if(this.id ==="green"){
        removeClasses(cardBeignDragged, "green");
    }
    else if(this.id ==="blue"){
        removeClasses(cardBeignDragged, "blue");
    }
    else if(this.id ==="purple"){
        removeClasses(cardBeignDragged, "purple");
    }
    else if(this.id ==="red"){
        removeClasses(cardBeignDragged, "red");
    }
    
    this.appendChild(cardBeignDragged);
}

function dragleave(){
  
    this.classList.remove('over');
}

function drop(){
    this.classList.remove('over');
}

// 모달창 js
$(document).ready(function(){
    function alignModal(){
        var modalDialog = $(this).find(".modal-dialog");
        
        // Applying the top margin on modal dialog to align it vertically center
        modalDialog.css("margin-top", Math.max(0, ($(window).height() - modalDialog.height()) / 2));
    }
    // Align modal when it is displayed
    $(".modal").on("shown.bs.modal", alignModal);
    
    // Align modal when user resize the window
    $(window).on("resize", function(){
        $(".modal:visible").each(alignModal);
    });   
});