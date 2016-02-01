//_XButton(buttonID)
var b;
b = argument0

time -= btime[b]

switch state
{
    case 0: _Start(1)  break
    case 1: 
        switch b
        {
            case 0: _Start(2) break
            case 1: if playthrough = 1 || hasItem("note: 'E'") _Start(5) else _Start(3) break
        }
    break
    case 2:
        switch b
        {
            case 0: if playthrough = 1 || hasItem("note: 'E'") _Start(5) else _Start(3) break;
            case 1: _Start(4) break;
            case 2: _Start(17) break;
        }
    break  
    case 9: 
        _Start(1)
    break
    case 3: 
        switch b
        {
            case 0: _Start(5) break;
            case 1: _Start(16) break; //TODO
        }        
    break
    case 4: 
        switch b
        {
            case 0: if patInHisRoom _Start(6) else _Start(8) break;
            case 1: _Start(7) break;
            case 2: if playthrough = 1 || hasItem("note: 'E'") _Start(5) else _Start(3) break;
        }
    break
    case 5: 
        switch b
        {
            case 0: _Start(11) break;
            case 1: _Start(18) break;
            case 2: _Start(12) break;
        }
    break    
    case 6: 
        switch b
        {
            case 0: if playthrough = 1 || hasItem("note: 'E'") _Start(5) else _Start(3) break;
            case 1: _Start(7) break;
        }
    break  
    case 7: 
        switch b
        {
            case 0: if playthrough = 1 || hasItem("note: 'E'") _Start(5) else _Start(3) break;
            case 1: if patInHisRoom _Start(6) else _Start(8) break;
        }
    break
    case 8: 
        switch b
        {
            case 0: if hasItem("note: 'E'") _Start(5) else _Start(3) break;
            case 1: _Start(7) break;
        }
    break
    case 11: 
        switch b
        {
            case 0: alt = true _Start(5) break;
            case 1: _Start(13) break;
            case 2: _Start(14) break; 
        }        
    break
    case 12: 
        alt = true _Start(5)
    break
    case 13: 
        switch b
        {
            case 0: alt = true _Start(11) break;
            case 1: _Start(15) break;
        }
    break
    case 14: 
        alt = true _Start(11)
    break
    case 15: 
        alt = true _Start(11)     
    break
    case 16: 
        _Start(5)
    break
    case 17: 
        switch b
        {
            case 0: if hasItem("note: 'E'") _Start(5) else _Start(3) break;
            case 1: _Start(8) break;
            case 2: _Start(7) break;
        }
    break
    case 18:
        switch b
        {
            case 0: alt = true _Start(5) break;
            case 1: _Start(19) break;
            case 2: _Start(20) break;
        }    
    break
    case 19: 
        alt = true _Start(5)
    break
    case 20:
        alt = true _Start(5)
    break
    case 21: 
        game_end()
    break
    default:
}

/*
    case 1: 
        switch b
        {
            case 0:  break;
        }
    break


