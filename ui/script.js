const app = new Vue({
    el: '#app',
    data: {
        speed: '000',
        fuel: '0',
        vehicle: false,
        currentType: 'km/h', // Default
    },
    methods: {
        formatSpeed(speed) {
            return ('000' + Math.round(speed)).substr(-3)
        },
        update({
            vehicle, speed, fuel, currentType
        }){
            this.vehicle = vehicle != undefined ? vehicle : this.vehicle;
            this.fuel = fuel != undefined ? fuel: this.fuel;
            this.speed = speed != undefined ? this.formatSpeed(speed) : this.speed;
            this.currentType = currentType != undefined ? currentType : this.currentType
        }
    },
    mounted() {
        window.addEventListener('message', ({data}) => this[data.type] && this[data.type](data))
    }
})