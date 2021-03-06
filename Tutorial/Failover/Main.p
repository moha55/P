type IHaltable((IService, IReliableStorage)) = { halt };

machine Main {
    var reliableStorage: IReliableStorage;
    var service: IService;
    start state Init {
        entry {
            var m: machine;
            reliableStorage = new IReliableStorage();
            service = new IService();
            m = new IHaltable(service, reliableStorage);
            send m, halt;
            m = new IHaltable(service, reliableStorage); 
        }
    }
}