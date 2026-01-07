import { LightningElement } from 'lwc';

import get_Top10_Opportunities from '@salesforce/apex/OpportunityController.get_Top10_Opportunities';

 

import { loadScript } from 'lightning/platformResourceLoader';

 

import chartjs from '@salesforce/resourceUrl/chartjs';

 

const COLORS = ['green','blue','lightgreen','yellow','violet','orange','indigo','pink','lightblue','red'];

 

//user defined json configuration

const CHART_CONFIG = {

    dom_selector: 'canvas.oppBarChart',

    type: 'pie',

    color: COLORS,

    label: 'Amount',

    options: {

        responsive: true,

        legend: { display: true },

        title: { display: true },

        animation: {

            animateScale: true

        }

    }

}

 

export default class OpportunityGraph extends LightningElement {

    error;

    _chart;

    _chartjsInitialized = false;

    renderedCallback() {

 

        if (this._chartjsInitialized) {

            return;

        }

        this._chartjsInitialized = true;

       

       

        loadScript(this, chartjs)

            .then(get_Top10_Opportunities)

            .then((result) => {

                console.log('Data returned from Apex', result);

                let oppData = result;

                let oppLabels = [];

                let oppAmounts = [];

                for (let i = 0; i < oppData.length; i++) {

                     oppLabels.push(oppData[i].CloseDate);

                     oppAmounts.push(oppData[i].Amount);

                     console.log(JSON.stringify(oppData));

                }

                //chart js configuration

                const config = {

                    type: CHART_CONFIG.type,

                    data: {

                        labels: oppLabels,

                        datasets: [{

                            label: CHART_CONFIG.label,

                            backgroundColor: CHART_CONFIG.color,

                            data: oppAmounts

                        }]

                    },

                    options: CHART_CONFIG.options

                };

                const ctx = this.template

                    .querySelector(CHART_CONFIG.dom_selector)

                    .getContext('2d');

                this._chart = new window.Chart(ctx, config);

            })

            .catch(error => {

                this.error = error;

            });

    }

}